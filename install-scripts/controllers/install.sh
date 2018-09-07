#! /usr/bin/env bash

sudo apt update
echo "Attempting to fix Xbox One Bluetooth compatibility..."
sudo apt install -y sysfsutils

sudo echo '/module/bluetooth/parameters/disable_ertm=1' > /etc/sysfs.conf

