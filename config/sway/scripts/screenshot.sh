#!/bin/sh
# A script that uses grim and slurp to take a full screenshot.
# The result is saved to a file and to the clipboard.

OUTPUT="$HOME/Pictures/Screenshots/$(date +'%y%m%d_%H%M%S').png"

grim -l 9 "$OUTPUT" \
  && wl-copy --type image/png < "$OUTPUT" \
  && notify-send 'Screenshot taken!' -u low
