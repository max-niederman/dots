#!/usr/bin/env bash

OUTFILE="$HOME/.config/rofi/colors.rasi"

change_color() { 
    cat > $OUTFILE <<- EOF
/* colors */

* {
  al:   #00000000;
  bg:   ${BG}FF;
  bga:  ${AC}33;
  bar:  ${MF}FF;
  fg:   ${FG}FF;
  ac:   ${AC}FF;
}
EOF

}

hex_to_rgb() {
    # Convert a hex value WITHOUT the hashtag (#)
    R=$(printf "%d" 0x${1:0:2})
    G=$(printf "%d" 0x${1:2:2})
    B=$(printf "%d" 0x${1:4:2})
}

get_fg_color(){
    INTENSITY=$(calc "$R*0.299 + $G*0.587 + $B*0.114")
    
    if [ $(echo "$INTENSITY>186" | bc) -eq 1 ]; then
        MF="#202020"
    else
        MF="#F5F5F5"
    fi
}

# Source the pywal color file
. "$HOME/.cache/wal/colors.sh"

BG=`printf "%s\n" "$background"`
FG=`printf "%s\n" "$foreground"`
FGA=`printf "%s\n" "$color8"`
AC=`printf "%s\n" "$color1"`
SC=`printf "%s\n" "$color2"`
AL=`printf "%s\n" "$color3"`

HEX=${AC:1}

hex_to_rgb $HEX
get_fg_color
change_color
