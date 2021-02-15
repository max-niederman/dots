function walu --description "Wrapper over wal with scripts to update applications"
     wal $argv

     echo "Updating user themes:"
     sh $HOME/.config/polybar/scripts/pywal.sh && echo "Updated polybar theme."
     sh $HOME/.config/rofi/scripts/pywal.sh && echo "Updated rofi theme."
     daemonize $HOME/.config/bspwm/bspwmrc && echo "Reloading WM and children in the background."
     pywalfox update && echo "Updated Firefox theme."
     daemonize $HOME/.config/wal/scripts/update-gtk.sh \
        && echo "Started GTK+ theme compilation in the background."
end
