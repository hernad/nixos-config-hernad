## Build

```bash
docker load < $(nix-build docker.nix)
docker push superboum/backup-psql:???
```


