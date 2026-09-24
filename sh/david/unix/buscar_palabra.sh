#!/bin/bash
clear
if [ $# -ne 2 ]; then
    printf "Uso: %s <palabra> <archivo>\n" "$0"
    exit 1
fi
palabra=$1
archivo=$2
if [ ! -r "$archivo" ]; then
    printf "Error: %s no existe o no es legible\n" "$archivo"
    exit 2
fi
grep -n "$palabra" "$archivo"
printf "Coincidencias: %s\n" "$(grep -c "$palabra" "$archivo")"