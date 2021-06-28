FROM monius/build-system-ubuntu:advanced

RUN sudo sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list \
  && sudo apt-get update \ 
  && sudo apt-get dist-upgrade -y \
  && sudo apt-get install $(curl -fsSL git.io/bbr-v2alpha-ubuntu-hirsute) -y \
  && sudo apt-get -qq build-dep linux -y \
  && sudo apt-get -qq autoremove --purge \
  && sudo apt-get -qq clean 

RUN sudo sed -Ei 's/required /sufficient /' /etc/pam.d/chsh \
  && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
  && curl -L git.io/antibody | sudo sh -s - -b /usr/local/bin \
  && curl -L git.io/ubuntu-hirsute-p10k > ~/.p10k.zsh \
  && curl -L git.io/ubuntu-hirsute-zshrc > ~/.zshrc \
  && curl -L git.io/ubuntu-hirsute-antibody | antibody bundle  > ~/.zsh_plugins.sh \
  && antibody bundle < ~/.bundles.txt > ~/.zsh_plugins.sh \
  && antibody update \
  && chsh -s /bin/zsh 