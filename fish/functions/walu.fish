function walu --description "Wrapper over wal with extensible automatic theme updates"
     wal $argv

     echo "Running update scripts:"
     set -l scripts (find ~/.config/wal/update.d -executable -type f)
     for script in $scripts
         eval $script
     end
end
