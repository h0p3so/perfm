#!/bin/bash
clear
printf "Hello World from Shell\n"
printf "Sistema operativo: %s\n" "$(uname -s)"
printf "Equipo: %s\n" "$HOSTNAME"
printf "Usuario: %s\n" "$USER"
printf "Fecha y hora: %s\n" "$(date '+%d/%m/%Y %H:%M:%S')"