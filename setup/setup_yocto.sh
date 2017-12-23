#!/usr/bin/env bash

echo "Configuring yocto build env..."

# Install dependencies needed by yocto
sudo apt-get install -y gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat libsdl1.2-dev xterm

# Install kas project helper tool
sudo apt-get install -y python3-pip
pip3 install kas