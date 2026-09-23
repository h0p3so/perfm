#!/bin/sh
clear
archivo=/etc/profile
lineas=$(wc -l < "$archivo" | tr -d ' ')
palabras=$(wc -w < "$archivo" | tr -d ' ')
bytes=$(wc -c < "$archivo" | tr -d ' ')
echo "El numero de lineas del archivo $archivo es: $lineas"
echo "El numero de palabras es: $palabras"
echo "El tamano en bytes es: $bytes"
echo "Primeras cinco lineas:"
head -n 5 "$archivo"
