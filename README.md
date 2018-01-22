# titan

# Building Locally

    sudo ./setup/install_titan_prereqs.sh
    sudo ./setup/install_drake_prereqs.sh
    mkdir build
    cd build
    cmake ..
    make

# Building In Docker

Make sure that you can run `docker` without `sudo`. To set that up, just do:

    sudo usermod -aG docker $USER

and then log out and back in. You should only ever have to do this once. 

### First, build the docker image with all dependencies

    cd setup
    ./docker_build.py

### Then build our code inside the resulting image

    ./docker_run.py

    # in the shell created by `docker_run.py`:
    cd /titan
    mkdir build
    cd build
    cmake ..
    make

# Checklist for updating Drake

    - [ ] Update SHA in CMakeLists.txt
    - [ ] cp build/src/drake/setup/ubuntu/16.04/install_prereqs.sh setup/install_drake_prereqs.sh
