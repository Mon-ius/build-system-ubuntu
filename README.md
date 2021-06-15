[![Docker Pulls](https://badgen.net/docker/pulls/monius/build-system-ubuntu)](https://hub.docker.com/r/monius/build-system-ubuntu)

## Build-system-ubuntu

This docker image aims at providing a utilized development environment out of the box. Different from other images, it was designed to overcome some unknown network environment and let you make good usage of the target machine just like at home.

### Usage

There are three different types of container with tags: `base`, `advanced`, `latest`:

- `base` only contains very basic setup, so that you can modify a lot based on it.
- `advanced` contains ssh, zero-tier network entrance and updated software, you can quickly start by specify `$USER` and `$NETWORK` ENV variables.
- `latest` contains all features in `advanced`, besides, it has large pre-installed software and tools, such as `ZSH` and zsh plugins.

#### Docker cli

It's recommended to start with `advanced`, by default the login user would be `ubuntu`:

```bash
docker run \
    --name=build-sys \
    --hostname=build-sys `#optional` \
    -e NETWORK=yournetworkid `#zerotier` \
    -e PUBLIC_KEY=yourpublickey `#optional` \
    --net=host \
    --cap-add=NET_ADMIN \
    --cap-add=SYS_ADMIN \
    --device=/dev/net/tun \
    --restart unless-stopped \
    monius/build-system-ubuntu:advanced -d
```

#### Docker-compose

`docker-compose.yaml` could replace some `args` in a file to run a container. See [docker-compose.yaml](https://github.com/Mon-ius/build-system-ubuntu/blob/master/personal/Dockerfile). Put essential environment variables in `.env`, then:

```bash
#start
docker-compose -f ./personal/docker-compose.yaml up -d
#stop
docker-compose -f ./personal/docker-compose.yaml down
```

It's easy to build your own container with `ARG` such as default login USER, etc:

See [Docker-file](https://github.com/Mon-ius/build-system-ubuntu/blob/master/personal/Dockerfile) and [Entry-point](https://github.com/Mon-ius/build-system-ubuntu/blob/master/personal/entrypoint.sh). For example :

```bash
docker build -t build-personal \
    --build-arg USER=monius \
    ./base
```

#### Source

https://github.com/Mon-ius/build-system-ubuntu

#### Reference

- [hadoop-docker](https://github.com/sequenceiq/hadoop-docker)
- [openssh-docker](https://github.com/linuxserver/docker-openssh-server)
- [nginx-docker](https://github.com/nginxinc/docker-nginx)
