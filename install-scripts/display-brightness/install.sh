#! /usr/bin/env bash

# My goal with this is to have a general purpose utility to manage display brightness.
# I'm specifically working with a 2014 Apple Thunderbolt display 
# which seems to be unsupported by OS default device management UI.
# 
# This is far from 100% but at least is starting progress towards a solution.

# Background reference:
# https://www.dionysopoulos.me/239-apple-display-brightness-controls-in-ubuntu-desktop.html
# https://www.ddcutil.com/

sudo apt install -y ddcutil i2c-tools

# https://www.ddcutil.com/config/#grant-readwrite-permission-for-the-devi2c-n-devices-representing-monitors
sudo usermod $(whoami) -aG i2c

# Check if installation is working
ddcutil environment

