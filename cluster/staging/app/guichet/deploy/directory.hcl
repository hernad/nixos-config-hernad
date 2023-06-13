job "guichet" {
  datacenters = [ "neptune", "orion" ]
  type = "service"
  priority = 90

  group "guichet" {
    count = 1

    network {
      port "web_port" { to = 9991 }
    }

    task "guichet" {
      driver = "docker"
      config {
        image = "dxflrs/guichet:18"
        readonly_rootfs = true
        ports = [ "web_port" ]
        volumes = [
          "secrets/config.json:/config.json"
        ]
      }

      template {
        data = file("../config/guichet/config.json.tpl")
        destination = "secrets/config.json"
      }

      resources {
        memory = 200
      }

      service {
        name = "guichet"
        tags = [
          "guichet",
          "tricot guichet.bring-out.me",
          "d53-cname guichet.bring-out.me",
        ]
        port = "web_port"
        address_mode = "host"
        check {
          type = "tcp"
          port = "web_port"
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

