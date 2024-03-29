#!/usr/bin/env bash

wallpaper='{{ wallpaper }}'

background='{{ colors.background | hex }}'
foreground='{{ colors.foreground | hex }}'

black='{{ colors.palette.black | hex }}'
red='{{ colors.palette.red | hex }}'
green='{{ colors.palette.green | hex }}'
yellow='{{ colors.palette.yellow | hex }}'
blue='{{ colors.palette.blue | hex }}'
purple='{{ colors.palette.purple | hex }}'
cyan='{{ colors.palette.cyan | hex }}'
white='{{ colors.palette.white | hex }}'

accent0='{{ colors.accents.0 | hex }}'
accent1='{{ colors.accents.1 | hex }}'
accent2='{{ colors.accents.2 | hex }}'
accent3='{{ colors.accents.3 | hex }}'
accent4='{{ colors.accents.4 | hex }}'
accent5='{{ colors.accents.5 | hex }}'
