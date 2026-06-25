#!/bin/sh
# This script is intended to let me toggle my power profiles with
# my F8 ("Mode") key. 
current=$(powerprofilesctl get)

if [[ "$current" = "balanced" ]]; then
  powerprofilesctl set performance
elif [[ "$current" = "performance" ]]; then
  powerprofilesctl set power-saver
else
  powerprofilesctl set balanced
fi
