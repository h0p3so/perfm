#!/bin/bash
ruta=$(dirname "$0")
bitacora="$ruta/bitacora.txt"

cmdbanner() {
    clear
    printf "========================================\n"
    printf "            MENU PRINCIPAL\n"
    printf "========================================\n"
    printf "1) Ambiente      2) /etc/profile\n"
    printf "3) Buscar palabra 4) Usuarios\n"
    printf "5) Permisos      6) Auditoria\n"
    printf "7) Salir\n"
    printf "Opcion: "
}

auditar() {
    clear
    registro=""
    for arch in /var/log/authlog /var/log/secure /var/log/auth.log; do
        if [ -r "$arch" ]; then
            registro=$arch
            break
        fi
    done
    if [ -z "$registro" ]; then
        printf "No hay registros accesibles (ejecute como root)\n"
        return
    fi
    printf "Archivo: %s\n" "$registro"
    grep -i "fail" "$registro" | grep root | awk '{print $1, $2, $3}'
    printf "Total de intentos fallidos: %s\n" "$(grep -i fail "$registro" | grep -c root)"
}

while true; do
    cmdbanner
    read -r opcion
    printf "%s;%s;%s\n" "$(date '+%Y-%m-%d %H:%M:%S')" "$(whoami)" "$opcion" >> "$bitacora"
    case $opcion in
        1) "$ruta/ejercicio1.sh" ;;
        2) "$ruta/ejercicio2.sh" ;;
        3)
            printf "Palabra: "
            read -r palabra
            printf "Archivo: "
            read -r archivo
            "$ruta/buscar_palabra.sh" "$palabra" "$archivo"
            ;;
        4) "$ruta/ejercicio4.sh" ;;
        5)
            printf "Directorio: "
            read -r directorio
            printf "Permisos: "
            read -r permisos
            "$ruta/buscar_archivos.sh" "$directorio" "$permisos"
            ;;
        6) auditar ;;
        7)
            printf "Chau\n"
            exit 0
            ;;
        *) printf "Opcion invalida\n" ;;
    esac
    read -r -p "Presione Enter para continuar..."
done