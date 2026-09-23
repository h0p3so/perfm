$bitacora = "$PSScriptRoot\bitacora.txt"

function Auditoria {
    Clear-Host
    Write-Output "Intentos fallidos de inicio de sesion de Administrador:"
    try {
        $eventos = @(Get-WinEvent -FilterHashtable @{ LogName = "Security"; Id = 4625 } -ErrorAction Stop |
            Where-Object { $_.Properties[5].Value -eq "Administrator" -or $_.Properties[5].Value -eq "Administrador" })
    } catch {
        $eventos = @()
    }
    $eventos | ForEach-Object { Write-Output $_.TimeCreated }
    Write-Output "Total de intentos fallidos: $($eventos.Count)"
}

while ($true) {
    Clear-Host
    Write-Output "===== MENU ====="
    Write-Output "1. Identificacion del ambiente"
    Write-Output "2. Informacion del archivo hosts"
    Write-Output "3. Buscar palabra en archivo"
    Write-Output "4. Extraer usuarios"
    Write-Output "5. Buscar archivos por permisos"
    Write-Output "6. Auditoria"
    Write-Output "7. Terminar"
    $opcion = Read-Host "Escoja una opcion"
    Add-Content $bitacora "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss');$(whoami);$opcion"
    switch ($opcion) {
        "1" { & "$PSScriptRoot\ejercicio1.ps1" }
        "2" { & "$PSScriptRoot\ejercicio2.ps1" }
        "3" {
            $palabra = Read-Host "Palabra"
            $archivo = Read-Host "Archivo"
            & "$PSScriptRoot\buscar_palabra.ps1" $palabra $archivo
        }
        "4" { & "$PSScriptRoot\ejercicio4.ps1" }
        "5" {
            $directorio = Read-Host "Directorio"
            $permiso = Read-Host "Permiso"
            & "$PSScriptRoot\buscar_archivos.ps1" $directorio $permiso
        }
        "6" { Auditoria }
        "7" {
            Write-Output "Hasta luego"
            exit 0
        }
        default { Write-Output "Opcion invalida" }
    }
    Read-Host "Presione Enter para continuar..."
}
