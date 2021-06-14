FROM monius/build-system-ubuntu:advanced

RUN export DEBIAN_FRONTEND=noninteractive \
  && sudo sed -Ei 's/^# deb-src /deb-src /' /etc/apt/sources.list \
  && sudo apt-get update \ 
  && sudo apt-get install $(curl -fsSL git.io/bbr-v2alpha-ubuntu-hirsute) -y \
  && sudo apt-get -qq build-dep linux -y \
  && sudo apt-get -qq autoremove --purge \
  && sudo apt-get -qq clean
