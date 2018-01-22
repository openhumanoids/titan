FROM ubuntu:xenial-20180112.1

COPY ./install_titan_prereqs.sh /tmp/install_titan_prereqs.sh
COPY ./install_drake_prereqs.sh /tmp/install_drake_prereqs.sh
RUN apt-get update && \
    yes "Y" | /tmp/install_titan_prereqs.sh && \
    yes "Y" | /tmp/install_drake_prereqs.sh
