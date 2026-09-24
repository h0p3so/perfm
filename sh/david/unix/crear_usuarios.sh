#!/bin/bash
for usuario in usuario1 usuario2 usuario3; do
    useradd -m -s /bin/bash -c "Cuenta de practica $usuario" "$usuario"
    printf "Usuario %s listo\n" "$usuario"
done