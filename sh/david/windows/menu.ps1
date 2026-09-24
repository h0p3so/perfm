$bitacora = Join-Path $PSScriptRoot "bitacora.txt"

function Auditar {
    Clear-Host
    try {
        $eventos = @(Get-WinEvent -FilterHashtable @{ LogName = 'Security'; Id = 4625 } -ErrorAction Stop |
            Where-Object { $_.Properties[5].Value -match 'Administrator|Administrador' })
    } catch {
        $eventos = @()
    }
    $eventos | ForEach-Object { Write-Host $_.TimeCreated }
    Write-Host "Total de intentos fallidos: $($eventos.Count)"
}

for (;;) {
    Clear-Host
    Write-Host "===== MENU ====="
    Write-Host "1) Ambiente      2) Archivo hosts"
    Write-Host "3) Buscar palabra 4) Usuarios"
    Write-Host "5) Permisos      6) Auditoria"
    Write-Host "7) Salir"
    $opcion = Read-Host "Opcion"
    Add-Content $bitacora "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss');$env:USERNAME;$opcion"
    switch ($opcion) {
        '1' { & "$PSScriptRoot\ejercicio1.ps1" }
        '2' { & "$PSScriptRoot\ejercicio2.ps1" }
        '3' {
            $palabra = Read-Host "Palabra"
            $archivo = Read-Host "Archivo"
            & "$PSScriptRoot\buscar_palabra.ps1" $palabra $archivo
        }
        '4' { & "$PSScriptRoot\ejercicio4.ps1" }
        '5' {
            $directorio = Read-Host "Directorio"
            $permiso = Read-Host "Permiso"
            & "$PSScriptRoot\buscar_archivos.ps1" $directorio $permiso
        }
        '6' { Auditar }
        '7' { Write-Host "Chau"; exit }
        default { Write-Host "Opcion invalida" }
    }
    Read-Host "Presione Enter para continuar..."
}