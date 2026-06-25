#!/bin/sh
# This script is intended to ensure that the backlight doesn't turn off when
# the brightness is all the way down.

current=$(brightnessctl g)

if [[ "$current" -le 7 ]]; then
  brightnessctl s 1
else
  brightnessctl s "$1"%-
fi
