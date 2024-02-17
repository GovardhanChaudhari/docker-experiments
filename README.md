# docker-experiments

## This branch uses linux kernel LTS version 6.6.14 with LTS ubuntu 22.04

- Kernel version number settings are stored in .env file
- Kernel is compiled in 5 to 6 minuits on Intel 12400F CPU with 32GB RAM of 3200Mhz

### Run following command to deploy apk 

```
docker compose run --service-ports deploy-apk
```

### Run following command to build image

```
docker compose build
```

### Run following command to build install metasploit-framework stage

```
docker compose build install-metasploit-framework
```

### Run following command to run metasploit-framework image just built by aboce stage

```
docker run -it --rm mybuild/gvc-alpine-metasploit 
```

To exit msfconsole type

```
exit
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
