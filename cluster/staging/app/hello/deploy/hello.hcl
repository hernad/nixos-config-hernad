

job "nix2-hello-service" {
  datacenters = ["sa1"]
  type        = "service"

  group "hellos" {

    count = 3
    
    network {
      port "http_port" { static = 8080 }
 
    }

    task "firewall-open" {
      user = "root"

      lifecycle {
        hook = "prestart"
        sidecar = false
      }
    
      driver = "nix2"
      config {
        packages = [
          "#iptables",
        ]
    
        #iptables -A INPUT -p tcp --dport $port -j ACCEPT
    
        command = "iptables"
        #command = "whoami"
  
        args = [
          "-I", "INPUT", 
          "-p", "tcp", 
          "--dport", "8080",  
          "-j", "ACCEPT"
        ]
      }
    
    }

    task "firewall-close" {
      user = "root"

      lifecycle {
        hook = "poststop"
        sidecar = false
      }
    
      driver = "nix2"
      config {
        packages = [
          "#iptables",
        ]
    
        #iptables -A INPUT -p tcp --dport $port -j ACCEPT
    
        command = "iptables"
  
        args = [
          "-D", "INPUT", 
          "-p", "tcp", 
          "--dport", "8080",  
          "-j", "ACCEPT"
        ]
      }
    
    }

    # This task defines a server that runs a simple python file server on port 8080,
    # which allows to explore the contents of the filesystem namespace as visible
    # by processes that run inside the task.
    # A bunch of utilities are included as well, so that you can exec into the container
    # and explore what's inside by yourself.
    task "nix-python-serve-http" {
      driver = "nix2"

      service {
        name = "python-http"
        port = "http_port"
        address_mode = "host"
      }

      config {
        packages = [
          "#python3",
          "#bash",
          "#coreutils",
          "#iputils",
          "#dnsutils",
          "#curl",
          "#nix",
          "#git",
          "#cacert",
          "#strace",
          "#gnugrep",
          "#findutils",
          "#mount",
        ]
        command = "python3"
        args = [ "-m", "http.server", "8080" ]
      }


      #env = {
      #  SSL_CERT_FILE = "/etc/ssl/certs/ca-bundle.crt"
      #}
    }
  }
}