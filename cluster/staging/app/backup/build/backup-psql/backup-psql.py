#!/usr/bin/env python3
import shutil,sys,os,datetime,minio,subprocess

working_directory = "."
if 'CACHE_DIR' in os.environ: working_directory = os.environ['CACHE_DIR']
required_space_in_bytes = 20 * 1024 * 1024 * 1024
bucket = os.environ['AWS_BUCKET']
key = os.environ['AWS_ACCESS_KEY_ID']
secret = os.environ['AWS_SECRET_ACCESS_KEY']
endpoint = os.environ['AWS_ENDPOINT']
pubkey = os.environ['CRYPT_PUBLIC_KEY']
psql_host = os.environ['PSQL_HOST']
psql_user = os.environ['PSQL_USER']
s3_prefix = str(datetime.datetime.now())
files = [ "backup_manifest", "base.tar.gz", "pg_wal.tar.gz" ]
clear_paths = [ os.path.join(working_directory, f) for f in files ]
crypt_paths = [ os.path.join(working_directory, f) + ".age" for f in files ]
s3_keys = [ s3_prefix + "/" + f for f in files ]

def abort(msg):
  for p in clear_paths + crypt_paths:
    if os.path.exists(p):
        print(f"Remove {p}")
        os.remove(p)

  if msg: sys.exit(msg)
  else: print("success")

# Check we have enough space on disk
if shutil.disk_usage(working_directory).free < required_space_in_bytes:
  abort(f"Not enough space on disk at path {working_directory} to perform a backup, aborting")

# Check postgres password is set
if 'PGPASSWORD' not in os.environ:
  abort(f"You must pass postgres' password through the environment variable PGPASSWORD")

# Check our working directory is empty
if len(os.listdir(working_directory)) != 0:
  abort(f"Working directory {working_directory} is not empty, aborting")

# Check Minio
client = minio.Minio(endpoint, key, secret)
if not client.bucket_exists(bucket):
  abort(f"Bucket {bucket} does not exist or its access is forbidden, aborting")

# Perform the backup locally
try:
  ret = subprocess.run(["pg_basebackup",
    f"--host={psql_host}",
    f"--username={psql_user}",
    f"--pgdata={working_directory}",
    f"--format=tar",
    "--wal-method=stream",
    "--gzip",
    "--compress=6",
    "--progress",
    "--max-rate=5M",
  ])
  if ret.returncode != 0:
    abort(f"pg_basebackup exited, expected return code 0, got {ret.returncode}. aborting")
except Exception as e:
  abort(f"pg_basebackup raised exception {e}. aborting")

# Check that the expected files are here
for p in clear_paths:
  print(f"Checking that {p} exists locally")
  if not os.path.exists(p):
    abort(f"File {p} expected but not found, aborting")

# Cipher them
for c, e in zip(clear_paths, crypt_paths):
  print(f"Ciphering {c} to {e}")
  try:
    ret = subprocess.run(["age", "-r", pubkey, "-o", e, c])
    if ret.returncode != 0:
      abort(f"age exit code is {ret}, 0 expected. aborting")
  except Exception as e:
    abort(f"aged raised an exception. {e}. aborting")

# Upload the backup to S3
for p, k in zip(crypt_paths, s3_keys):
  try:
    print(f"Uploading {p} to {k}")
    result = client.fput_object(bucket, k, p)
    print(
      "created {0} object; etag: {1}, version-id: {2}".format(
        result.object_name, result.etag, result.version_id,
      ),
    )
  except Exception as e:
    abort(f"Exception {e} occured while upload {p}. aborting")

# Check that the files have been uploaded
for k in s3_keys:
  try:
    print(f"Checking that {k} exists remotely")
    result = client.stat_object(bucket, k)
    print(
      "last-modified: {0}, size: {1}".format(
        result.last_modified, result.size, 
      ),
    )
  except Exception as e:
    abort(f"{k} not found on S3. {e}. aborting")

abort(None)
