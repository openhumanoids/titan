FROM ubuntu:xenial-20180112.1

COPY . /titan
WORKDIR /titan
RUN apt-get update && \
    yes "Y" | ./setup/install_titan_prereqs.sh && \
    yes "Y" | ./setup/install_drake_prereqs.sh
VOLUME /titan-build
WORKDIR /titan-build
RUN cmake /titan
RUN make
