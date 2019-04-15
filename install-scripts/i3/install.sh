#!/usr/bin/env bash

sudo apt update
sudo -E apt install -y \
  i3 \
  rofi \
  xdotool \
  feh \
  scrot \
  redshift \
  xautolock \
  xclip \
  xclip \
  acpi \
  libmagickwand-dev


git clone git@github.com:NoraCodes/charpicker.git ~/.config/rofi-charpicker
