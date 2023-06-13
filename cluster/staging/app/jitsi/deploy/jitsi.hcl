job "jitsi" {
  datacenters = ["neptune", "orion"]
  type = "service"

  priority = 50

  constraint {
    attribute = "${attr.cpu.arch}"
    value     = "amd64"
  }

  group "control_plane" {

    network {
      port "bosh_port" { }
      port "xmpp_port" { static = 5223 }
      port "https_port" { }
    }

    task "xmpp" {
      driver = "docker"
      config {
        image = "superboum/amd64_jitsi_xmpp:v11"
        ports = [ "bosh_port", "xmpp_port" ]
        network_mode = "host"
        volumes = [
          "secrets/prosody.cfg.lua:/etc/prosody/prosody.cfg.lua",
          "secrets/certs/auth.jitsi.crt:/var/lib/prosody/auth.jitsi.crt",
          "secrets/certs/auth.jitsi.key:/var/lib/prosody/auth.jitsi.key",
          "secrets/certs/jitsi.crt:/var/lib/prosody/jitsi.crt",
          "secrets/certs/jitsi.key:/var/lib/prosody/jitsi.key"
        ]
      }

      template {
        data = <<EOF
JICOFO_AUTH_PASSWORD={{ key "secrets/jitsi/jicofo_pass" | trimSpace }}
JVB_AUTH_PASSWORD={{ key "secrets/jitsi/jvb_pass" | trimSpace }}
EOF
        destination = "secrets/global_env"
        env = true
      }

     template {
       data = file("../config/prosody.cfg.lua")
       destination = "secrets/prosody.cfg.lua"
     }

      # --- secrets ---
      template {
        data = "{{ key \"secrets/jitsi/auth.jitsi.crt\" }}"
        destination = "secrets/certs/auth.jitsi.crt"
      }

      template {
        data = "{{ key \"secrets/jitsi/auth.jitsi.key\" }}"
        destination = "secrets/certs/auth.jitsi.key"
      }

      template {
        data = "{{ key \"secrets/jitsi/jitsi.crt\" }}"
        destination = "secrets/certs/jitsi.crt"
      }

      template {
        data = "{{ key \"secrets/jitsi/jitsi.key\" }}"
        destination = "secrets/certs/jitsi.key"
      }

      resources {
        cpu = 300
        memory = 200
      }

      service {
        tags = [ "jitsi", "bosh" ]
        port = "bosh_port"
        address_mode = "host"
        name = "bosh-jitsi"
        check {
          type = "tcp"
          port = "bosh_port"
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
        tags = [ "jitsi", "xmpp" ]
        port = "xmpp_port"
        address_mode = "host"
        name = "xmpp-jitsi"
      }
    }

    task "front" {
      driver = "docker"
      config {
        image = "superboum/amd64_jitsi_meet:v6"
        network_mode = "host"
        ports = [ "https_port" ]
        volumes = [
          "secrets/certs/jitsi.crt:/etc/nginx/jitsi.crt",
          "secrets/certs/jitsi.key:/etc/nginx/jitsi.key",
          "secrets/config.js:/srv/jitsi-meet/config.js",
          "secrets/nginx.conf:/etc/nginx/nginx.conf"
        ]
      }

      template {
        data = file("../config/config.js")
        destination = "secrets/config.js"
      }

      template {
        data = file("../config/nginx.conf")
        destination = "secrets/nginx.conf"
      }

      # --- secrets ---
      template {
        data = "{{ key \"secrets/jitsi/jitsi.crt\" }}"
        destination = "secrets/certs/jitsi.crt"
      }
      template {
        data = "{{ key \"secrets/jitsi/jitsi.key\" }}"
        destination = "secrets/certs/jitsi.key"
      }

      resources {
        cpu = 300
        memory = 200
      } 

     service {
        tags = [
          "jitsi",
          "tricot jitsi.bring-out.me",
          "d53-cname jitsi.bring-out.me",
        ]
        port = "https_port"
        address_mode = "host"
        name = "https-jitsi"
        check {
          type = "tcp"
          port = "https_port"
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

    task "jicofo" {
      driver = "docker"
      config {
        image = "superboum/amd64_jitsi_conference_focus:v10"
        network_mode = "host"
        volumes = [
          "secrets/certs/jitsi.crt:/usr/local/share/ca-certificates/jitsi.crt",
          "secrets/certs/auth.jitsi.crt:/usr/local/share/ca-certificates/auth.jitsi.crt",
          "secrets/jicofo.conf:/etc/jitsi/jicofo.conf"
        ]
      }

      template {
        data = file("../config/jicofo.conf")
        destination = "secrets/jicofo.conf"
      }

      #--- secrets ---
      template {
        data = "{{ key \"secrets/jitsi/jitsi.crt\" }}"
        destination = "secrets/certs/jitsi.crt"
      }

      template {
        data = "{{ key \"secrets/jitsi/auth.jitsi.crt\" }}"
        destination = "secrets/certs/auth.jitsi.crt"
      }

      resources {
        cpu = 300
        memory = 400
      } 
    }
  }

  group "data_plane" {
    network {
      port "video_port" { static = 8080 }
    }

    task "videobridge" {
      driver = "docker"
      config {
        image = "superboum/amd64_jitsi_videobridge:v21"
        network_mode = "host"
        ports = [ "video_port" ] 
        ulimit {
          nofile = "1048576:1048576"
          nproc = "65536:65536"
        }
        volumes = [
          "secrets/certs/jitsi.crt:/usr/local/share/ca-certificates/jitsi.crt",
          "secrets/certs/auth.jitsi.crt:/usr/local/share/ca-certificates/auth.jitsi.crt",
          "secrets/videobridge.conf:/etc/jitsi/videobridge.conf"
        ]
      }

      env {
        # Our container can autodetect the public IP with the ifconfig.me service
        # However we would like to avoid relying on a 3rd party service for production use
        # That's why I am setting the public IP address statically here VVVV
        #JITSI_NAT_PUBLIC_IP = "82.66.80.201"
      }

      template {
        data = file("../config/videobridge.conf")
        destination = "secrets/videobridge.conf"
      }

      # --- secrets ---
      template {
        data = "{{ key \"secrets/jitsi/jitsi.crt\" }}"
        destination = "secrets/certs/jitsi.crt"
      }

      template {
        data = "{{ key \"secrets/jitsi/auth.jitsi.crt\" }}"
        destination = "secrets/certs/auth.jitsi.crt"
      }

      resources {
        cpu = 900
        memory = 500
        memory_max = 3000
      } 

      service {
        tags = [ "jitsi", "(diplonat (tcp_port 8080) (udp_port 8080))" ]
        port = "video_port"
        address_mode = "host"
        name = "video-jitsi"
        check {
          type = "tcp"
          port = "video_port"
          interval = "60s"
          timeout = "5s"
        }
      }
    }
  }
}

