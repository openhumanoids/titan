# titan

Required packages:

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
    python-yaml \
    libyaml-cpp-dev


# Building Locally
    sudo setup/install_drake_prereqs.sh
    mkdir build
    cd build
    cmake ..
    make

# Building In Docker

    docker build -t titan .

# Checklist for updating Drake

    - [ ] Update SHA in CMakeLists.txt
    - [ ] cp build/src/drake/setup/ubuntu/16.04/install_prereqs.sh setup/install_drake_prereqs.sh
