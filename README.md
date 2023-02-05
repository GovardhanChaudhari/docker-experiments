# docker-experiments

### Run following command to build image

```
docker compose build
```

### Backup volume in tar file

Linux:
Note: Here --valumes-from takes name of the container (test-berryboot-buildroot-latest, from docker-compose file)

```
docker run --rm --volumes-from test-berryboot-buildroot-latest -v $(pwd):/backup ubuntu tar cvf /backup/buildroot-volume.tar /buildroot
```

Windows:
```
docker run --rm --volumes-from test-berryboot-buildroot-latest -v H:\dev\docker\docker-experiments:/backup ubuntu:20.04 tar cvf /backup/backup.tar /buildroot
```


## References
- https://docs.docker.com/storage/volumes/#back-up-restore-or-migrate-data-volumes