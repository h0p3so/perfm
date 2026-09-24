#!/bin/sh
clear
if [ $# -ne 2 ]; then
    echo "Uso: $0 directorio permisos"
    exit 1
fi
directorio=$1
permisos=$2
if [ ! -d "$directorio" ] || [ ! -r "$directorio" ] || [ ! -x "$directorio" ]; then
    echo "Error: el directorio $directorio no existe o no se puede leer"
    exit 2
fi
printf "Nombre a buscar en %s: " "$directorio"
read -r nombre
if [ -f "$directorio/$nombre" ]; then
    echo "$nombre es un archivo"
elif [ -d "$directorio/$nombre" ]; then
    echo "$nombre es un subdirectorio"
elif [ -e "$directorio/$nombre" ]; then
    echo "$nombre es otra cosa"
else
    echo "$nombre no existe en $directorio"
fi
echo "Archivos con permisos $permisos en $directorio:"
ls -l "$directorio" | grep "^$permisos"
total=$(ls -l "$directorio" | grep -c "^$permisos")
echo "Total de archivos encontrados: $total"
