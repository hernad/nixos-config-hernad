job "core-d53" {
  datacenters = ["sa1"]
  type = "service"
  priority = 90

  group "D53" {
    count = 1

    task "d53" {
      driver = "docker"

      config {
        image = "lxpz/amd64_d53:4"
        network_mode = "host"
        readonly_rootfs = true
        volumes = [
          "secrets:/etc/d53",
        ]
      }

      resources {
        cpu = 100
        memory = 100
      }

      restart {
        interval = "3m"
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
D53_CONSUL_HOST=https://consul.service.staging.consul:8501
D53_CONSUL_CA_CERT=/etc/d53/consul-ca.crt
D53_CONSUL_CLIENT_CERT=/etc/d53/consul-client.crt
D53_CONSUL_CLIENT_KEY=/etc/d53/consul-client.key
D53_PROVIDERS=bring-out.me:gandi
D53_GANDI_API_KEY={{ key "secrets/d53/gandi_api_key" }}
D53_ALLOWED_DOMAINS=bring-out.me
RUST_LOG=d53=info
EOH
        destination = "secrets/env"
        env = true
      }
    }
  }

  # Dummy task for Gitea (still on an external VM), runs on any bespin node
  # and allows D53 to automatically update the A record for git.bring-out.me
  # to the IPv4 address of the bespin site (that changes occasionnaly)
  group "gitea-dummy" {
    count = 1

    network {
      port "dummy" {
        to = 999
      }
    }

    task "main" {
      driver = "docker"

      constraint {
        attribute = "${meta.site}"
        operator = "="
        value = "sa1"
      }

      config {
        image = "alpine"
        command = "sh"
        args = ["-c", "while true; do echo x; sleep 60; done"]
        ports = [ "dummy" ]
      }

      service {
        name = "gitea-dummy"
        port = "dummy"
        tags = [
          "d53-a git.bring-out.me",
          "d53-cname test.bring-out.me",
        ]
      }
    }
  }
}