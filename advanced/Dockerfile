FROM monius/build-system-ubuntu:base

ARG USER=ubuntu
ENV NETWORK=''
ENV PUBLIC_KEY=''

RUN sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list \
  && apt-get update \ 
  && apt-get dist-upgrade -y \
  && apt-get install -y curl sudo net-tools openssh-server

RUN useradd -rm -d /home/$USER -s /bin/bash -g root -G sudo -u 1000 $USER
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN service ssh start

COPY entrypoint.sh /run/entrypoint.sh
ENTRYPOINT ["/run/entrypoint.sh"]

USER $USER
WORKDIR /home/$USER

EXPOSE 9993/udp

STOPSIGNAL SIGQUIT