# titan

# Building Locally

    sudo ./setup/install_titan_prereqs.sh
    sudo ./setup/install_drake_prereqs.sh
    mkdir build
    cd build
    cmake ..
    make

# Building In Docker

    docker build -t titan .

# Checklist for updating Drake

    - [ ] Update SHA in CMakeLists.txt
    - [ ] cp build/src/drake/setup/ubuntu/16.04/install_prereqs.sh setup/install_drake_prereqs.sh
