job "core-bottin" {
  datacenters = ["sa1"]
  type = "system"
  priority = 90

  update {
    max_parallel = 1
    stagger = "1m"
  }

  group "bottin" {
    constraint {
      distinct_property = "${meta.site}"
      value = "1"
    }

    network {
      port "ldap_port" {
        static = 389
        to = 389
      }
    }

    task "bottin" {
      driver = "docker"
      config {
        image = "dxflrs/bottin:7h18i30cckckaahv87d3c86pn4a7q41z"
        network_mode = "host"
        readonly_rootfs = true
        ports = [ "ldap_port" ]
        volumes = [
          "secrets/config.json:/config.json",
          "secrets:/etc/bottin",
        ]
      }

      restart {
        interval = "5m"
        attempts = 10
        delay    = "15s"
        mode     = "delay"
      }

      resources {
        memory = 100
        memory_max = 200
      }

      template {
        data = file("../config/bottin/config.json.tpl")
        destination = "secrets/config.json"
      }

      template {
        data = "{{ key \"secrets/consul/consul.crt\" }}"
        destination = "secrets/consul.crt"
      }

      template {
        data = "{{ key \"secrets/consul/consul-client.crt\" }}"
        destination = "secrets/consul-client.crt"
      }

      template {
        data = "{{ key \"secrets/consul/consul-client.key\" }}"
        destination = "secrets/consul-client.key"
      }

      template {
        data = <<EOH
CONSUL_HTTP_ADDR=https://consul.service.staging.consul:8501
CONSUL_HTTP_SSL=true
CONSUL_CACERT=/etc/bottin/consul.crt
CONSUL_CLIENT_CERT=/etc/bottin/consul-client.crt
CONSUL_CLIENT_KEY=/etc/bottin/consul-client.key
EOH
        destination = "secrets/env"
        env = true
      }

      service {
        tags = [ "${meta.site}" ]
        port = "ldap_port"
        address_mode = "host"
        name = "bottin"
        check {
          type = "tcp"
          port = "ldap_port"
          interval = "60s"
          timeout = "5s"
          check_restart {
            limit = 3
            grace = "90s"
            ignore_warnings = false
          }
        }
      }
    }
  }
}
