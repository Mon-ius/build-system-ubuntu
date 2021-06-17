FROM monius/build-system-ubuntu:base

ARG USER=ubuntu
ENV NETWORK=''
ENV PUBLIC_KEY=''

RUN apt-get update \ 
  && apt-get install -y apt-utils curl sudo net-tools openssh-server \
  && apt-get dist-upgrade -y \
  && apt-get -qq autoremove --purge \
  && apt-get -qq clean

RUN useradd -rm -d /home/$USER -s /bin/bash -g root -G sudo -u 1000 $USER
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN service ssh start

COPY entrypoint.sh /run/entrypoint.sh
ENTRYPOINT ["/run/entrypoint.sh"]

USER $USER
WORKDIR /home/$USER

EXPOSE 9993/udp

STOPSIGNAL SIGQUIT