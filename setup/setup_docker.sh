#!/usr/bin/env bash

echo "Installing Docker"

# Install needed dependencies
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add Docker repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Install
sudo apt-get update
sudo apt-get install -y docker-ce

# Add current user to the docker group
read -p "Allow current user to manage docker without sudo [yes/no]?" -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
else
    sudo usermod -aG docker $USER
    echo "Done, logout in order to make this change effective!"
fi

# Start docker on boot
sudo systemctl enable docker
