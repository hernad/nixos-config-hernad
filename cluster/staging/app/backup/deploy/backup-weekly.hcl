job "backup_weekly" {
  datacenters = ["sa1"]
  type = "batch"

  priority = "60"

  periodic {
    cron = "@weekly"
    // Do not allow overlapping runs.
    prohibit_overlap = true
  }

  group "backup-psql" {
    task "main" {
      driver = "docker"

      config {
        image = "superboum/backup-psql-docker:gyr3aqgmhs0hxj0j9hkrdmm1m07i8za2"
        volumes = [
          // Mount a cache on the hard disk to avoid filling up the SSD
          "/mnt/storage/tmp_bckp_psql:/mnt/cache"
        ]
      }

      template {
        data = <<EOH
CACHE_DIR=/mnt/cache
AWS_BUCKET=backups-pgbasebackup
AWS_ENDPOINT=s3.bring-out.backup.out.ba
AWS_ACCESS_KEY_ID={{ key "secrets/postgres/backup/aws_access_key_id" }}
AWS_SECRET_ACCESS_KEY={{ key "secrets/postgres/backup/aws_secret_access_key" }}
CRYPT_PUBLIC_KEY={{ key "secrets/postgres/backup/crypt_public_key" }}
PSQL_HOST={{ env "meta.site" }}.psql-proxy.service.prod.consul
PSQL_USER={{ key "secrets/postgres/keeper/pg_repl_username" }}
PGPASSWORD={{ key "secrets/postgres/keeper/pg_repl_pwd" }}
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
}
