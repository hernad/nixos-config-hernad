job "core-diplonat" {
  datacenters = ["sa1", "bespin"]
  type = "system"
  priority = 90

  update {
    max_parallel = 2
    stagger = "1m"
  }

  group "diplonat" {
    task "diplonat" {
      driver = "docker"

      config {
        image = "lxpz/amd64_diplonat:6"
        network_mode = "host"
        readonly_rootfs = true
        privileged = true
        volumes = [
          "secrets:/etc/diplonat",
        ]
      }

      restart {
        interval = "5m"
        attempts = 10
        delay    = "15s"
        mode     = "delay"
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
DIPLONAT_REFRESH_TIME=60
DIPLONAT_EXPIRATION_TIME=300
DIPLONAT_CONSUL_NODE_NAME={{ env "attr.unique.hostname" }}
DIPLONAT_CONSUL_URL=https://consul.service.prod.consul:8501
DIPLONAT_CONSUL_TLS_SKIP_VERIFY=true
DIPLONAT_CONSUL_CLIENT_CERT=/etc/diplonat/consul-client.crt
DIPLONAT_CONSUL_CLIENT_KEY=/etc/diplonat/consul-client.key
RUST_LOG=debug
EOH
        destination = "secrets/env"
        env = true
      }

      resources {
        memory = 100
        memory_max = 200
      }
    }
  }
}
