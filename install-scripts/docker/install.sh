#! /usr/bin/env bash

# ref: https://docs.docker.com/install/linux/docker-ce/ubuntu/

# clean old incompatible versions first
sudo apt-get remove -y docker docker-engine docker.io containerd runc

# ensure prereqs are available
sudo apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# alternatives available for other architectures
sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# verify installation
sudo docker run hello-world

# allow using docker as non-root
sudo groupadd docker
sudo usermod -aG docker $USER

# start the daemon automatically
sudo systemctl enable docker

# docker-compose https://docs.docker.com/compose/install/
# recommended install requires knowing a version number to download, so use pip
# for something automatically more current than apt
# TODO: use asdf to grab latest python 2.7.x and update pip first
pip && pip install docker-compose
