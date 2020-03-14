#!/bin/bash
echo "installing dependencies"
apt install --yes autoconf automake libtool curl make g++ unzip \
    protobuf-c-compiler protobuf-compiler protobuf-compiler-grpc \
    cmake build-essential autoconf libtool pkg-config
# libgflags-dev is only required if building with make (deprecated)
 apt-get install --yes libgflags-dev
# clang and LLVM C++ lib is only required for sanitizer builds
apt-get install --yes clang-5.0 libc++-dev
LIBTOOL=glibtool 
LIBTOOLIZE=glibtoolize make

# verify if grpc plugins is in bin
GRPC_EXIST=$(ls /usr/local/bin | grep --count grpc_)
if [ $GRPC_EXIST -eq 0 ]
then
    echo "clone grpc repository"
    git clone https://github.com/grpc/grpc .temp_grpc_path
    cd .temp_grpc_path
    echo "downloading dependencies for compilation"
    git submodule update --init --recursive
    echo "compile grpc"
    make
    ## show all binaries plugin     
    echo "copy binaries to /usr/local/bin/ "
    ls bins/opt/
    chmod +x  bins/opt/*
    ## copy to bin path (or change the plugin path in protool.yaml)
    cp ./bins/opt/grpc_* /usr/local/bin/
    cd ..
    rm -rf .temp_grpc_path
fi
echo "DOWNLOADING PROTOTOOL....."
curl -sSL \
  https://github.com/uber/prototool/releases/download/v1.8.0/prototool-$(uname -s)-$(uname -m).tar.gz | \
  tar -C /usr/local --strip-components 1 -xz

echo "DONE." && prototool version