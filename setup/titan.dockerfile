FROM ubuntu:xenial-20180112.1

COPY ./install_titan_prereqs.sh /tmp/install_titan_prereqs.sh
COPY ./install_drake_prereqs.sh /tmp/install_drake_prereqs.sh
RUN apt-get update && \
    yes "Y" | /tmp/install_titan_prereqs.sh && \
    yes "Y" | /tmp/install_drake_prereqs.sh

ARG USER_NAME
ARG USER_ID
ARG USER_GID

RUN useradd -ms /bin/bash $USER_NAME
RUN usermod -u $USER_ID $USER_NAME
RUN groupmod -g $USER_GID $USER_NAME

USER $USER_NAME
