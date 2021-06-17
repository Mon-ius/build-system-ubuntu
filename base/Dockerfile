ARG ZT_COMMIT=e8f7d5ef9e7ba6be0b2163cfa31f8817ba5b18f4

FROM ubuntu:hirsute as builder
RUN export DEBIAN_FRONTEND=noninteractive \
  && sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list \
  && apt-get update \ 
  && apt-get dist-upgrade -y \
  && apt-get install -y apt-utils curl\
  && apt-get install $(curl -fsSL git.io/bbr-v2alpha-ubuntu-hirsute) -y \
  && apt-get -qq build-dep linux -y \
  && apt-get -qq autoremove --purge \
  && apt-get -qq clean \
  && git clone --quiet https://github.com/zerotier/ZeroTierOne.git /src \
  && git -C src reset --quiet --hard ${ZT_COMMIT} \
  && cd /src \
  && make -f make-linux.mk

FROM ubuntu:hirsute
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ="Europe/London"
LABEL description="Build system on ubuntu"

COPY --from=builder /src/zerotier-one /usr/sbin/
RUN mkdir -p /var/lib/zerotier-one \
  && ln -s /usr/sbin/zerotier-one /usr/sbin/zerotier-idtool \
  && ln -s /usr/sbin/zerotier-one /usr/sbin/zerotier-cli

RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update \ 
  && apt-get dist-upgrade -y