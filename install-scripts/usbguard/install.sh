#!/usr/bin/env bash

# https://usbguard.github.io/
# Be careful, this install is not turnkey and makes it easy to 
# disable your own hardware I/O access to a machine...

# sudo apt update
# sudo apt install usbguard usbguard-applet-qt

# give ourselves a chance to configure it before locking down
# sudo systemctl stop usbguard.service

# TODO: configure user access to usbguard-daemon.conf
# IPCAllowedUsers
# TODO: configure /etc/usbuard/rules.conf with default rules
# based on existing devices

# TODO: ensure the gui applet runs

# sudo systemctl start usbguard.service
