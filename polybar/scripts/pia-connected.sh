#!/usr/bin/env bash

piactl monitor connectionstate | while read -r state
do
    case $state in
        "Connected")
            echo " Active"
            ;;

        "Disconnected")
            echo " Inactive"
            ;;

        *)
            echo " $state"
    esac
done
