#! /usr/bin/bash

# Use qt5ct for QT theme
export QT_QPA_PLATFORMTHEME="qt5ct"

# Java window rendering fixes
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"
export _JAVA_AWT_WM_NONREPARENTING=1
