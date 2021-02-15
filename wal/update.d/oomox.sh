#!/usr/bin/env bash

colors=$HOME/.cache/wal/colors-oomox

daemonize /usr/bin/oomox-cli -o wal $colors \
    && echo "Compiling GTK+ theme in the background."
