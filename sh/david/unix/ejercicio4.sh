#!/bin/bash
clear
salida="usuarios.txt"
awk -F: '$3 >= 1000 {print $1 "\t" $5 "\t" $7}' /etc/passwd > "$salida"
total=$(wc -l < "$salida")
cat -n "$salida"
printf "Registros guardados en %s: %s\n" "$salida" "$total"