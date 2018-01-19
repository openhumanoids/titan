FROM ubuntu:xenial-20180112.1

RUN apt-get update && apt-get install -y \
	build-essential \
	autoconf \
	libgtk2.0-dev \
	freeglut3-dev

COPY .. /titan
WORKDIR /titan
RUN mkdir build
WORKDIR /titan/build
RUN cmake ..
RUN make
