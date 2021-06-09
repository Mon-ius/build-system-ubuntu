FROM monius/build-system-ubuntu:base

ARG USER=monius
RUN useradd -ms /bin/bash $USER
USER $USER
WORKDIR /home/$USER