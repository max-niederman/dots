#!/usr/bin/env bash

HOME=/home/max
colors=$HOME/.cache/wal/colors-oomox

oomox-cli -o wal $colors \
    && echo "Compiled GTK+ theme."
