#!/bin/bash
clear
if [ $# -ne 2 ]; then
    printf "Uso: %s <directorio> <permisos>\n" "$0"
    exit 1
fi
directorio=$1
permisos=$2
if [ ! -d "$directorio" ] || [ ! -r "$directorio" ] || [ ! -x "$directorio" ]; then
    printf "Error: %s no existe o es inaccesible\n" "$directorio"
    exit 2
fi
printf "Nombre a buscar en %s: " "$directorio"
read -r nombre
if [ -f "$directorio/$nombre" ]; then
    printf "%s = archivo\n" "$nombre"
elif [ -d "$directorio/$nombre" ]; then
    printf "%s = subdirectorio\n" "$nombre"
else
    printf "%s no existe en %s\n" "$nombre" "$directorio"
fi
ls -l "$directorio" | grep "^$permisos" | tr -s ' ' | cut -d' ' -f9-
printf "Coincidencias con %s: %s\n" "$permisos" "$(ls -l "$directorio" | grep -c "^$permisos")"