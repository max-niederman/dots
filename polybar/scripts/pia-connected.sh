#!/usr/bin/env bash

piactl monitor connectionstate | while read -r state
do
    case $state in
        "Connected")
            echo " Up"
            ;;

        "Disconnected")
            echo " Down"
            ;;

        *)
            echo " $state"
    esac
done
