#!/bin/sh
for usuario in usuario1 usuario2 usuario3; do
    useradd -m -c "Usuario de prueba $usuario" "$usuario"
    echo "Usuario $usuario creado"
done
