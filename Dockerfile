FROM ubuntu:xenial-20180112.1

RUN apt-get update && apt-get install -y \
    autoconf \
    cmake \
    freeglut3-dev \
    git \
    libglib2.0-dev \
    libgtk2.0-dev \
    libqt5opengl5-dev \
    libqt5x11extras5-dev \
    libqwt-qt5-dev \
    libx11-dev \
    libxext-dev \
    libxt-dev \
    python-dev \
    python-lxml \
    python-numpy \
    python-scipy \
    python-yaml

COPY . /titan
WORKDIR /titan
RUN yes "Y" | ./setup/install_drake_prereqs.sh
RUN mkdir build
WORKDIR /titan/build
RUN cmake ..
RUN make
