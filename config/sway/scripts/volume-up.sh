#!/bin/sh
# This script ensures that the volume doesn't go over 100%

vol=$(pactl get-sink-volume @DEFAULT_SINK@ | head -n1 | awk -F'/' '{print $2}' | tr -d ' %')  # [web:10]

if (( "$vol" + "$1" >= 100 )); then
    pactl set-sink-volume @DEFAULT_SINK@ 100%
fi

vol=$(pactl get-sink-volume @DEFAULT_SINK@ | head -n1 | awk -F'/' '{print $2}' | tr -d ' %')  # [web:10]

if [ "$vol" -lt 100 ]; then
    pactl set-sink-volume @DEFAULT_SINK@ +"$1"%
fi
