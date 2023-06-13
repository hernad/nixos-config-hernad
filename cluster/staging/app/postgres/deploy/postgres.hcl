job "postgres14" {
  datacenters = ["sa1" ]
  type = "system"
  priority = 90

  update {
    max_parallel = 1
    min_healthy_time  = "2m"
    healthy_deadline  = "5m"
    auto_revert = true
  }

  group "postgres" {
    network {
      port "psql_proxy_port" { static = 5432 }
      port "psql_port" { static = 5433 }
    }

    constraint {
      attribute = "${attr.unique.hostname}"
      operator = "set_contains_any"
	  # target: courgette,df-ymf,abricot (or ananas)
      value = "diplotaxis,courgette,concombre,df-ymf"
    }

    restart {
      interval = "10m"
      attempts = 10
      delay    = "15s"
      mode     = "delay"
    }

    task "sentinel" {
      driver = "docker"

      config {
        image = "superboum/amd64_postgres:v11"
        network_mode = "host" 
        readonly_rootfs = false
        command = "/usr/local/bin/stolon-sentinel"
        args = [
          "--cluster-name", "hernadpgcluster",
          "--store-backend", "consul",
          "--store-endpoints", "https://consul.service.prod.consul:8501",
          "--store-ca-file", "/certs/consul-ca.crt",
          "--store-cert-file", "/certs/consul-client.crt",
          "--store-key", "/certs/consul-client.key",
        ]
        volumes = [
          "secrets/certs:/certs",
        ]
      }
      resources {
        memory = 20
        memory_max = 100
      }

      template {
        data = "{{ key \"secrets/consul/consul-ca.crt\" }}"
        destination = "secrets/certs/consul-ca.crt"
      }
      template {
        data = "{{ key \"secrets/consul/consul-client.crt\" }}"
        destination = "secrets/certs/consul-client.crt"
      }
      template {
        data = "{{ key \"secrets/consul/consul-client.key\" }}"
        destination = "secrets/certs/consul-client.key"
      }
    }

    task "proxy" {
      driver = "docker"

      config {
        image = "superboum/amd64_postgres:v11"
        network_mode = "host" 
        readonly_rootfs = false
        command = "/usr/local/bin/stolon-proxy"
        args = [
          "--cluster-name", "hernadpgcluster",
          "--store-backend", "consul",
          "--store-endpoints", "https://consul.service.prod.consul:8501",
          "--store-ca-file", "/certs/consul-ca.crt",
          "--store-cert-file", "/certs/consul-client.crt",
          "--store-key", "/certs/consul-client.key",
          "--port", "${NOMAD_PORT_psql_proxy_port}",
          "--listen-address", "0.0.0.0",
          "--log-level", "info"
        ]
        volumes = [
          "secrets/certs:/certs",
        ]
        ports = [ "psql_proxy_port" ]
      }

      resources {
        memory = 20
        memory_max = 100
      }

      template {
        data = "{{ key \"secrets/consul/consul-ca.crt\" }}"
        destination = "secrets/certs/consul-ca.crt"
      }
      template {
        data = "{{ key \"secrets/consul/consul-client.crt\" }}"
        destination = "secrets/certs/consul-client.crt"
      }
      template {
        data = "{{ key \"secrets/consul/consul-client.key\" }}"
        destination = "secrets/certs/consul-client.key"
      }

      service {
        tags = ["sql", "${meta.site}"]
        port = "psql_proxy_port"
        address_mode = "host"
        name = "psql-proxy"
        check {
          type = "tcp"
          port = "psql_proxy_port"
          interval = "60s"
          timeout = "5s"
          check_restart {
            limit = 3
            grace = "10m"
            ignore_warnings = false
          }
        }
      }
    }

    task "keeper" {
      driver = "docker"

      config {
        image = "superboum/amd64_postgres:v11"
        network_mode = "host" 
        readonly_rootfs = false
        command = "/usr/local/bin/stolon-keeper"
        args = [
          "--cluster-name", "hernadpgcluster",
          "--store-backend", "consul",
          "--store-endpoints", "https://consul.service.prod.consul:8501",
          "--store-ca-file", "/certs/consul-ca.crt",
          "--store-cert-file", "/certs/consul-client.crt",
          "--store-key", "/certs/consul-client.key",
          "--data-dir", "/mnt/persist",
          "--pg-su-password", "${PG_SU_PWD}",
          "--pg-repl-username", "${PG_REPL_USER}",
          "--pg-repl-password", "${PG_REPL_PWD}",
          /*
	   The postgres daemon accepts 0.0.0.0, ::, and * here but not Stolon.
           Otherwise you will have the following error and your cluster will be broken (no replication)
           WARN	cmd/keeper.go:1979	provided --pg-listen-address "*": is not an ip address but a hostname. This will be advertized to the other components and may have undefined behaviors if resolved differently by other hosts
           WARN	cmd/keeper.go:1984	cannot resolve provided --pg-listen-address "*": lookup *: no such host
          */
          "--pg-listen-address", "${attr.unique.network.ip-address}",
          "--pg-port", "${NOMAD_PORT_psql_port}",
          "--pg-bin-path", "/usr/lib/postgresql/14/bin/"
        ]
        ports = [ "psql_port" ]
        volumes = [
          "/mnt/ssd/postgres:/mnt/persist",
          "/mnt/storage/postgres_extended:/mnt/slow",
          "secrets/certs:/certs"
        ]
      }

      template {
        data = file("../config/keeper/env.tpl")
        destination = "secrets/env"
        env = true
      }

      template {
        data = "{{ key \"secrets/consul/consul-ca.crt\" }}"
        destination = "secrets/certs/consul-ca.crt"
      }
      template {
        data = "{{ key \"secrets/consul/consul-client.crt\" }}"
        destination = "secrets/certs/consul-client.crt"
      }
      template {
        data = "{{ key \"secrets/consul/consul-client.key\" }}"
        destination = "secrets/certs/consul-client.key"
      }

      resources {
        memory = 400
        memory_max = 600
      }

      service {
        tags = ["sql", "${meta.site}"]
        port = "psql_port"
        address_mode = "host"
        name = "psql-keeper"
        check {
          type = "tcp"
          port = "psql_port"
          interval = "60s"
          timeout = "5s"
        }
      }
    }
  }
}

