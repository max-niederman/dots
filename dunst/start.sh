#!/usr/bin/env bash

# Terminate already running dunst instances
killall -q dunst

# Source wal colors
source "${HOME}/.cache/wal/colors.sh"

# Wait until the processes have been shut down
while pgrep -u $UID -x dunst >/dev/null; do sleep 1; done

/usr/bin/dunst \
    -lb "${color0:-#F0F0F0}" \
    -nb "${color0:-#F0F0F0}" \
    -cb "${color0:-#F0F0F0}" \
    -lf "${color15:=#000000}" \
    -bf "${color15:=#000000}" \
    -cf "${color15:=#000000}" \
    -nf "${color15:=#000000}"
