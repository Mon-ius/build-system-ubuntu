FROM monius/build-system-ubuntu:base

ARG USER=ubuntu
ENV NETWORK=''
ENV PUBLIC_KEY=''

RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get update \ 
  && apt-get install -y curl sudo apt-utils net-tools openssh-server \
  && apt-get upgrade -y

RUN useradd -rm -d /home/$USER -s /bin/bash -g root -G sudo -u 1000 $USER 
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN service ssh start

COPY entrypoint.sh /run/entrypoint.sh
ENTRYPOINT ["/run/entrypoint.sh"]

USER $USER
WORKDIR /home/$USER

EXPOSE 9993/udp

STOPSIGNAL SIGQUIT