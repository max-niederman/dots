function walu --description "Wrapper over wal with scripts to update applications"
     wal $argv

     echo "Updating user themes:"
     sh $HOME/.config/bspwm/bspwmrc && echo "Updated WM colors."
     pywalfox update && echo "Updated Firefox theme."
     sh $HOME/scripts/wal-discord-update.sh
     daemonize $HOME/scripts/wal-gtk-update.sh && echo "Starting GTK+ theme compilation in the background."
end
