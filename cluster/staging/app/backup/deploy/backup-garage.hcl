job "backup-garage" {
  datacenters = ["sa1"]
  type = "batch"

  priority = "60"

  periodic {
    cron = "@daily"
    // Do not allow overlapping runs.
    prohibit_overlap = true
  }

  group "backup-garage" {
    task "main" {
      driver = "docker"

      config {
        image = "lxpz/backup_garage:9"
		network_mode = "host"
        volumes = [
		  "secrets/rclone.conf:/etc/secrets/rclone.conf"
        ]
      }

      template {
        data = <<EOH
GARAGE_ADMIN_TOKEN={{ key "secrets/garage/admin_token" }}
GARAGE_ADMIN_API_URL=http://localhost:3903
GARAGE_ACCESS_KEY={{ key "secrets/backup/garage/s3_access_key_id" }}
TARGET_BACKUP_DIR={{ key "secrets/backup/garage/target_sftp_directory" }}
EOH
         destination = "secrets/env_vars"
         env = true
      }

      template {
        data = <<EOH
[garage]
type = s3
provider = Other
env_auth = false
access_key_id = {{ key "secrets/backup/garage/s3_access_key_id" }}
secret_access_key = {{ key "secrets/backup/garage/s3_secret_access_key" }}
endpoint = http://localhost:3900
region = garage

[backup]
type = sftp
host = {{ key "secrets/backup/garage/target_sftp_host" }}
user = {{ key "secrets/backup/garage/target_sftp_user" }}
port = {{ key "secrets/backup/garage/target_sftp_port" }}
key_pem = {{ key "secrets/backup/garage/target_sftp_key_pem" | replaceAll "\n" "\\n" }}
shell_type = unix
EOH
		destination = "secrets/rclone.conf"
      }

      resources {
        cpu = 500
        memory = 200
		memory_max = 4000
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
