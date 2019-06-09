#!/bin/sh
xrandr \
  --output DisplayPort-1 --off \
  --output DisplayPort-0 --mode 2560x1440 --pos 1920x0 --rotate normal \
  --output eDP --primary --mode 1680x1050 --pos 4480x0 --rotate normal \
  --output DVI-I-1-1 --mode 1920x1080 --pos 0x0 --rotate normal \
  --output HDMI-0 --off
