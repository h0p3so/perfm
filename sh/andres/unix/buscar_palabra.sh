#!/bin/sh
clear
if [ $# -ne 2 ]; then
    echo "Uso: $0 palabra archivo"
    exit 1
fi
palabra=$1
archivo=$2
if [ ! -f "$archivo" ] || [ ! -r "$archivo" ]; then
    echo "Error: el archivo $archivo no existe o no tiene permiso de lectura"
    exit 2
fi
grep -n "$palabra" "$archivo"
total=$(grep -c "$palabra" "$archivo")
echo "Total de coincidencias: $total"
