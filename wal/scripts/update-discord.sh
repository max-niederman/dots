#!/usr/bin/env bash

walcache=$HOME/.cache/wal
output=$HOME/.local/share/powercord/src/Powercord/themes/wal
discordcss=$output/basetheme.css

cat $walcache/colors.css > $output/theme.css
cat $discordcss >> $output/theme.css \
    && echo "Updated Powercord theme."
