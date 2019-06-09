#!/bin/sh
xrandr \
  --output DisplayPort-1 --off \
  --output DisplayPort-0 --mode 2560x1440 --pos 0x0 --rotate normal \
  --output eDP --primary --mode 1680x1050 --pos 2560x0 --rotate normal \
  --output HDMI-0 --off
