#!/usr/bin/env bash

# Terminate already running dunst instances
killall -q dunst

# Source wal colors
source "${HOME}/.local/share/luthien/outputs/plugins/templates/shell.sh"

# Wait until the processes have been shut down
while pgrep -u $UID -x dunst >/dev/null; do sleep 1; done

/usr/bin/dunst \
    -lb "${background:-#F0F0F0}" \
    -nb "${background:-#F0F0F0}" \
    -cb "${background:-#F0F0F0}" \
    -lf "${accent1:=#000000}" \
    -nf "${accent0:=#000000}" \
    -cf "${red:=#000000}"
