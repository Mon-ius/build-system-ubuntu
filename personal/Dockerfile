FROM monius/build-system-ubuntu:base

ARG USER=ubuntu
ENV NETWORK=''
ENV PUBLIC_KEY=''

RUN export DEBIAN_FRONTEND=noninteractive \
  && sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list \
  && apt-get update \ 
  && apt-get install -y curl \
  && apt-get install $(curl -fsSL git.io/bbr-v2alpha-ubuntu-hirsute) -y \
  && apt-get -qq build-dep linux -y \
  && apt-get upgrade -y \
  && apt-get -qq autoremove --purge \
  && apt-get -qq clean

RUN useradd -rm -d /home/$USER -s /bin/bash -g root -G sudo -u 1000 $USER 
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN service ssh start

COPY entrypoint.sh /run/entrypoint.sh
ENTRYPOINT ["/run/entrypoint.sh"]

USER $USER
WORKDIR /home/$USER

RUN sudo sed -Ei 's/required /sufficient /' /etc/pam.d/chsh \
  && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
  && chsh -s /bin/zsh \
  && curl -L git.io/antigen > ~/.antigen.zsh \ 
  && curl -L git.io/ubuntu-hirsute-antigenrc > ~/.antigenrc \
  && curl -L git.io/ubuntu-hirsute-p10k > ~/.p10k.zsh \
  && curl -L git.io/ubuntu-hirsute-zshrc > ~/.zshrc \
  && echo "{\n}" > ~/package.json

EXPOSE 9993/udp

STOPSIGNAL SIGQUIT