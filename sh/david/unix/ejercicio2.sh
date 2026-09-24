#!/bin/bash
clear
archivo="/etc/profile"
lineas=$(wc -l < "$archivo")
palabras=$(wc -w < "$archivo")
bytes=$(stat -c %s "$archivo")
printf "Lineas: %s\nPalabras: %s\nTamano: %s bytes\n\nPrimeras 5 lineas:\n" "$lineas" "$palabras" "$bytes"
sed -n '1,5p' "$archivo"