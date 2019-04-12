#!/usr/bin/env bash

# https://packages.cisofy.com/community/#debian-ubuntu
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C80E383C3DE9F082E01391A0366C67DE91CA5D5F

sudo apt install apt-transport-https
echo "deb https://packages.cisofy.com/community/lynis/deb/ stable main" | sudo tee /etc/apt/sources.list.d/cisofy-lynis.list

sudo apt update
sudo apt install lynis
sudo lynis show version

# go ahead and apply some of the advice pre-emptively
sudo apt install \
  aide \
  debsums \
  pam_passwdqc \
  apt-show-versions
