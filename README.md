[![Docker Pulls](https://badgen.net/docker/pulls/monius/build-system-ubuntu)](https://hub.docker.com/r/monius/build-system-ubuntu)

## Build-system-ubuntu

#### Usage

The basic usage of the container:

docker run --name build-sys --device=/dev/net/tun --net=host \
    --cap-add=NET_ADMIN --cap-add=SYS_ADMIN \
    monius/build-system-ubuntu:base

Build your own container with `ARGS` such as default user and private zt network.

Example [Dockerfile](https://github.com/Mon-ius/build-system-ubuntu/blob/master/Dockerfile):

docker build -t build-sys:personal . \
    --build-arg USER=monius NETWORK=1c33c1ced09a6faf

docker run --name build-sys --device=/dev/net/tun --net=host \
    --cap-add=NET_ADMIN --cap-add=SYS_ADMIN \
    build-sys:personal

#### Source

https://github.com/Mon-ius/build-system-ubuntu