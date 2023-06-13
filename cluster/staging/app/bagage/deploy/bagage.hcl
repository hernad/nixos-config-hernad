job "bagage" {
  datacenters = ["sa1"]
  type = "service"
  priority = 90

  constraint {
    attribute = "${attr.cpu.arch}"
    value     = "amd64"
  }

  group "main" {
    count = 1

    network {
      port "web_port" { 
        static = 8080
        to = 8080 
      }
      port "ssh_port" { 
        static = 2222
        to = 2222
      }
    }

    task "server" {
      driver = "docker"
      config {
        image = "superboum/amd64_bagage:v11"
        readonly_rootfs = false
        network_mode = "host"
        volumes = [
          "secrets/id_rsa:/id_rsa"
        ]
        ports = [ "web_port", "ssh_port" ]
      }

      env {
        BAGAGE_LDAP_ENDPOINT = "bottin.service.prod.consul:389"
      }

      resources {
        memory = 200
        cpu = 100
      }

      template {
        data = "{{ key \"secrets/bagage/id_rsa\" }}"
        destination = "secrets/id_rsa"
      }

      service {
        name = "bagage-ssh"
        port = "ssh_port"
        address_mode = "host"
        tags = [
          "bagage",
          "(diplonat (tcp_port 2222))"
        ]
      }

      service {
        name = "bagage-webdav"
        tags = [
          "bagage",
          "tricot bagage.bring-out.me",
          "d53-cname bagage.bring-out.me",
        ]
        port = "web_port"
        address_mode = "host"
        check {
          type = "tcp"
          port = "web_port"
          address_mode = "host"
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

