#!/bin/sh
clear
salida=usuarios.txt
awk -F: '$3 >= 1000 {print $1 ";" $5 ";" $7}' /etc/passwd > "$salida"
total=$(wc -l < "$salida" | tr -d ' ')
cat "$salida"
echo "Registros escritos en $salida: $total"
