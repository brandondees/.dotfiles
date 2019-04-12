#! /usr/bin/env bash

# Add signing key 
wget -O - http://download.opensuse.org/repositories/devel:/languages:/pharo:/stable/xUbuntu_16.04/Release.key | apt-key add -

#add repository
echo "deb http://download.opensuse.org/repositories/devel:/languages:/pharo:/stable/xUbuntu_16.04/ ./" > /etc/apt/sources.list.d/pharo.list

# Update and install 
apt update && apt install pharo6-32-ui pharo6-64-ui
