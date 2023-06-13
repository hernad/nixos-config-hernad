job "garage" {
  datacenters = [ "sa1" ]
  type = "system"
  priority = 80

  update {
    max_parallel = 1
    min_healthy_time  = "60s"
  }

  group "garage" {
    network {
      port "s3" { static = 3900 }
      port "rpc" { static = 3901 }
      port "web" { static = 3902 }
      port "admin" { static = 3903 }
      port "k2v" { static = 3904 } 
    }

    update {
      max_parallel = 1
      min_healthy_time = "30s"
      healthy_deadline = "5m"
    }

    task "server" {
      driver = "docker"
      config {
        advertise_ipv6_address = true
        image = "dxflrs/garage:v0.8.2"
        command = "/garage"
        args = [ "server" ]
        network_mode = "host"
        volumes = [
          "/mnt/storage/garage/data:/data",
          "/mnt/ssd/garage/meta:/meta",
          "secrets/garage.toml:/etc/garage.toml",
          "secrets:/etc/garage",
        ]
        logging {
          type = "journald"
        }
      }

      template {
        data = file("../config/garage.toml")
        destination = "secrets/garage.toml"
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

      resources {
        memory = 1000
        memory_max = 3000
        cpu = 1000
      }

      kill_timeout = "20s"

      service {
        tags = [
          "garage_api",
          "tricot garage.bring-out.me",
          "tricot *.garage.bring-out.me",
          "tricot-site-lb",
        ]
        port = 3900
        address_mode = "driver"
        name = "garage-api"
        check {
          type = "tcp"
          port = 3900
          address_mode = "driver"
          interval = "60s"
          timeout = "5s"
          check_restart {
            limit = 3
            grace = "90s"
            ignore_warnings = false
          }
        }
      }

      service {
        tags = [
            "garage-web",
            "tricot * 1",
            #"tricot-add-header Content-Security-Policy default-src 'self' 'unsafe-inline'; script-src 'self' 'unsafe-inline' https://code.jquery.com/; frame-ancestors 'self'",
            "tricot-add-header Strict-Transport-Security max-age=63072000; includeSubDomains; preload",
            "tricot-add-header X-Frame-Options SAMEORIGIN",
            "tricot-add-header X-XSS-Protection 1; mode=block",
            "tricot-site-lb",
        ]
        port = 3902
        address_mode = "driver"
        name = "garage-web"
        check {
          type = "tcp"
          port = 3902
          address_mode = "driver"
          interval = "60s"
          timeout = "5s"
          check_restart {
            limit = 3
            grace = "90s"
            ignore_warnings = false
          }
        }
      }

      service {
        port = 3903
        address_mode = "driver"
        name = "garage-admin"
        check {
          type = "tcp"
          port = 3903
          address_mode = "driver"
          interval = "60s"
          timeout = "5s"
          check_restart {
            limit = 3
            grace = "90s"
            ignore_warnings = false
          }
        }
      }

      service {
        tags = [
          "garage_k2v",
          "tricot k2v.bring-out.me",
          "tricot-site-lb",
        ]
        port = 3904
        address_mode = "driver"
        name = "garage-k2v"
        check {
          type = "tcp"
          port = 3904
          address_mode = "driver"
          interval = "60s"
          timeout = "5s"
          check_restart {
            limit = 3
            grace = "90s"
            ignore_warnings = false
          }
        }
      }

      restart { 
        interval = "30m"  
        attempts = 10  
        delay    = "15s"  
        mode     = "delay"
      }
    }
  }
}
