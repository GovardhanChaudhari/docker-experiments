# docker-experiments

## This branch uses linux kernel LTS version 6.6.14 with LTS ubuntu 22.04

Kernel version number settings are stored in .env file

### Run following command to build image

```
docker compose build
```

### Run following command to build a particular stage, eg. here compile-kernel

```
docker compose build compile-kernel
```

### Run following command to test dockerfile commands

```
docker build --no-cache --progress=plain -f Dockerfile.test .
```

chatgpt prompt:
write a docker compose file for multiple dependent build stage, where first stage is build essentials, second is download kernel source ,third stage is compile kernel, and fourth stage is install kernel.
