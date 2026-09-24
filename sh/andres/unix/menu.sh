#!/bin/sh
dir=$(dirname "$0")
bitacora="$dir/bitacora.txt"

auditoria() {
    clear
    registro=""
    for archivo in /var/log/authlog /var/log/secure /var/log/auth.log; do
        if [ -r "$archivo" ]; then
            registro=$archivo
            break
        fi
    done
    if [ -z "$registro" ]; then
        echo "No se encontro un archivo de registro legible (ejecute como root)"
        return
    fi
    echo "Archivo de registro: $registro"
    echo "Intentos fallidos de acceso a root:"
    grep -i "fail" "$registro" | grep "root" | awk '{print $1, $2, $3}'
    total=$(grep -i "fail" "$registro" | grep -c "root")
    echo "Total de intentos fallidos: $total"
}

while true; do
    clear
    echo "===== MENU ====="
    echo "1. Identificacion del ambiente"
    echo "2. Informacion de /etc/profile"
    echo "3. Buscar palabra en archivo"
    echo "4. Extraer usuarios"
    echo "5. Buscar archivos por permisos"
    echo "6. Auditoria"
    echo "7. Terminar"
    printf "Escoja una opcion: "
    read -r opcion
    echo "$(date '+%Y-%m-%d %H:%M:%S');$(whoami);$opcion" >> "$bitacora"
    case $opcion in
        1) sh "$dir/ejercicio1.sh" ;;
        2) sh "$dir/ejercicio2.sh" ;;
        3)
            printf "Palabra: "
            read -r palabra
            printf "Archivo: "
            read -r archivo
            sh "$dir/buscar_palabra.sh" "$palabra" "$archivo"
            ;;
        4) sh "$dir/ejercicio4.sh" ;;
        5)
            printf "Directorio: "
            read -r directorio
            printf "Permisos: "
            read -r permisos
            sh "$dir/buscar_archivos.sh" "$directorio" "$permisos"
            ;;
        6) auditoria ;;
        7)
            echo "Hasta luego"
            exit 0
            ;;
        *) echo "Opcion invalida" ;;
    esac
    printf "Presione Enter para continuar..."
    read -r _
done
