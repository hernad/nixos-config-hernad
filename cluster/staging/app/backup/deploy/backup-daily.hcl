job "backup_daily" {
  datacenters = ["sa1"]
  type = "batch"

  priority = "60"

  periodic {
    cron = "@daily"
    // Do not allow overlapping runs.
    prohibit_overlap = true
  }

  group "backup-dovecot" {
    constraint {
      attribute = "${attr.unique.hostname}"
      operator = "="
      value = "doradille"
    }

    task "main" {
      driver = "docker"

      config {
        image = "restic/restic:0.14.0"
        entrypoint = [ "/bin/sh", "-c" ]
        args = [ "restic backup /mail && restic forget --group-by paths --keep-within 1m1d --keep-within-weekly 3m --keep-within-monthly 1y && restic prune --max-unused 50% --max-repack-size 2G && restic check" ]
        volumes = [
          "/mnt/ssd/mail:/mail"
        ]
      }

      template {
        data = <<EOH
AWS_ACCESS_KEY_ID={{ key "secrets/email/dovecot/backup_aws_access_key_id" }}
AWS_SECRET_ACCESS_KEY={{ key "secrets/email/dovecot/backup_aws_secret_access_key" }}
RESTIC_REPOSITORY={{ key "secrets/email/dovecot/backup_restic_repository" }}
RESTIC_PASSWORD={{ key "secrets/email/dovecot/backup_restic_password" }}
EOH

         destination = "secrets/env_vars"
         env = true
      }

      resources {
        cpu = 500
        memory = 100
		memory_max = 1000
      }

      restart {
        attempts = 2
        interval = "30m"
        delay = "15s"
        mode = "fail"
      }
    }
  }

  group "backup-consul" {
    task "consul-kv-export" {
      driver = "docker"

      lifecycle {      
        hook = "prestart"      
        sidecar = false    
      }

      config {
        image = "consul:1.13.1"
        network_mode = "host"
        entrypoint = [ "/bin/sh", "-c" ]
        args = [ "/bin/consul kv export > $NOMAD_ALLOC_DIR/consul.json" ]
        volumes = [
          "secrets:/etc/consul",
        ]
      }

      env {
        CONSUL_HTTP_ADDR = "https://consul.service.prod.consul:8501"
	CONSUL_HTTP_SSL = "true"
	CONSUL_CACERT = "/etc/consul/consul.crt"
	CONSUL_CLIENT_CERT = "/etc/consul/consul-client.crt"
	CONSUL_CLIENT_KEY = "/etc/consul/consul-client.key"
      }

      resources {
        cpu = 200
        memory = 200
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

      restart {
        attempts = 2
        interval = "30m"
        delay = "15s"
        mode = "fail"
      }
    }

    task "restic-backup" {
      driver = "docker"

      config {
        image = "restic/restic:0.12.1"
        entrypoint = [ "/bin/sh", "-c" ]
        args = [ "restic backup $NOMAD_ALLOC_DIR/consul.json && restic forget --group-by paths --keep-within 1m1d --keep-within-weekly 3m --keep-within-monthly 1y && restic prune --max-unused 50% --max-repack-size 2G && restic check" ]
      }


      template {
        data = <<EOH
AWS_ACCESS_KEY_ID={{ key "secrets/backup/consul/backup_aws_access_key_id" }}
AWS_SECRET_ACCESS_KEY={{ key "secrets/backup/consul/backup_aws_secret_access_key" }}
RESTIC_REPOSITORY={{ key "secrets/backup/consul/backup_restic_repository" }}
RESTIC_PASSWORD={{ key "secrets/backup/consul/backup_restic_password" }}
EOH

         destination = "secrets/env_vars"
         env = true
      }

      resources {
        cpu = 200
        memory = 200
      }

      restart {
        attempts = 2
        interval = "30m"
        delay = "15s"
        mode = "fail"
      }
    }
  }

  group "backup-cryptpad" {
    constraint {
      attribute = "${attr.unique.hostname}"
      operator = "="
      value = "courgette"
    }

    task "main" {
      driver = "docker"

      config {
        image = "restic/restic:0.12.1"
        entrypoint = [ "/bin/sh", "-c" ]
        args = [ "restic backup /cryptpad && restic forget --group-by paths --keep-within 1m1d --keep-within-weekly 3m --keep-within-monthly 1y && restic prune --max-unused 50% --max-repack-size 2G && restic check" ]
        volumes = [
          "/mnt/storage/cryptpad:/cryptpad"
        ]
      }

      template {
        data = <<EOH
AWS_ACCESS_KEY_ID={{ key "secrets/backup/cryptpad/backup_aws_access_key_id" }}
AWS_SECRET_ACCESS_KEY={{ key "secrets/backup/cryptpad/backup_aws_secret_access_key" }}
RESTIC_REPOSITORY={{ key "secrets/backup/cryptpad/backup_restic_repository" }}
RESTIC_PASSWORD={{ key "secrets/backup/cryptpad/backup_restic_password" }}
EOH

         destination = "secrets/env_vars"
         env = true
      }

      resources {
        cpu = 500
        memory = 100
		memory_max = 1000
      }

      restart {
        attempts = 2
        interval = "30m"
        delay = "15s"
        mode = "fail"
      }
    }
  }
}
