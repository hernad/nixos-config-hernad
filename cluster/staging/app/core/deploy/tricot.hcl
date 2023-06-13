job "core-tricot" {
  # bespin pas pour l'instant, on a des soucis de SSL avec gitea
  # on pourra mettre bespin quand on aura migré gitea de la vm vers le cluster
  # en attendant, les deux  ne sont pas capables de partager les certificats SSL
  # donc on laisse la VM gitea gérer les certifs et prendre tout le trafic http(s)
  datacenters = ["sa1"]
  type = "system"
  priority = 90

  update {
    max_parallel = 1
    stagger = "5m"
  }

  group "tricot" {
    constraint {
      distinct_property = "${meta.site}"
      value = "1"
    }

    network {
      port "http_port" { static = 80 }
      port "https_port" { static = 443 }
      port "metrics_port" { static = 9334 }
    }

    task "server" {
      driver = "docker"

      config {
        image = "lxpz/amd64_tricot:47"
        network_mode = "host"
        readonly_rootfs = true
        ports = [ "http_port", "https_port" ]
        volumes = [
          "secrets:/etc/tricot",
        ]
      }

      resources {
        cpu = 1000
        memory = 200
        memory_max = 500
      }

      restart {
        interval = "5m"
        attempts = 10
        delay    = "15s"
        mode     = "delay"
      }

      template {
        data = "{{ key \"secrets/consul/consul-ca.crt\" }}"
        destination = "secrets/consul-ca.crt"
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
TRICOT_NODE_NAME={{ env "attr.unique.hostname" }}
TRICOT_LETSENCRYPT_EMAIL=prod-sysadmin@bring-out.me
TRICOT_ENABLE_COMPRESSION=true
TRICOT_CONSUL_HOST=https://consul.service.prod.consul:8501
TRICOT_CONSUL_TLS_SKIP_VERIFY=true
TRICOT_CONSUL_CLIENT_CERT=/etc/tricot/consul-client.crt
TRICOT_CONSUL_CLIENT_KEY=/etc/tricot/consul-client.key
TRICOT_HTTP_BIND_ADDR=[::]:80
TRICOT_HTTPS_BIND_ADDR=[::]:443
TRICOT_METRICS_BIND_ADDR=[::]:9334
RUST_LOG=tricot=debug
EOH
        destination = "secrets/env"
        env = true
      }

      service {
        name = "tricot-http"
        port = "http_port"
        tags = [ "(diplonat (tcp_port 80))", "${meta.site}" ]
        address_mode = "host"
      }

      service {
        name = "tricot-https"
        port = "https_port"
        tags = [
          "(diplonat (tcp_port 443))",
          "${meta.site}",
          "d53-aaaa ${meta.site}.site.bring-out.me",
          "d53-a global.site.bring-out.me",
          "d53-aaaa global.site.bring-out.me",
        ]
        address_mode = "host"
      }

      service {
        name = "tricot-metrics"
        port = "metrics_port"
        address_mode = "host"
      }
    }
  }
}
