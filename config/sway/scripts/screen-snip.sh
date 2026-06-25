#!/bin/sh
# A script that uses grim and slurp to take a selective screenshot.
# The result is saved to a file and to the clipboard.

SELECTION=$(slurp)

OUTPUT="$HOME/Pictures/Screenshots/$(date +'%y%m%d_%H%M%S').png"

grim -l 3 -g "$SELECTION" "$OUTPUT" \
  && wl-copy --type image/png < "$OUTPUT" \
  && notify-send 'Screensnip taken!' -u low
