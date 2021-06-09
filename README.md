[![Docker Pulls](https://badgen.net/docker/pulls/monius/build-system-ubuntu)](https://hub.docker.com/r/monius/build-system-ubuntu)

## Build-system-ubuntu

#### Usage

```bash
docker run --name build-sys --device=/dev/net/tun --net=host \
  --cap-add=NET_ADMIN --cap-add=SYS_ADMIN \
  monius/build-system-ubuntu:base
```

#### Source

https://github.com/Mon-ius/build-system-ubuntu