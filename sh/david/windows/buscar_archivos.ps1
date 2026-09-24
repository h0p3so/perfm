Clear-Host
if ($args.Count -ne 2) {
    Write-Host "Uso: buscar_archivos.ps1 <directorio> <permiso>"
    exit 1
}
$directorio, $permiso = $args
if (-not (Test-Path $directorio -PathType Container)) {
    Write-Host "Error: $directorio no existe o es inaccesible"
    exit 2
}
$elementos = @(Get-ChildItem $directorio -File -ErrorAction SilentlyContinue)
$nombre = Read-Host "Nombre a buscar en $directorio"
$ruta = Join-Path $directorio $nombre
if (Test-Path $ruta -PathType Leaf) {
    Write-Host "$nombre = archivo"
} elseif (Test-Path $ruta -PathType Container) {
    Write-Host "$nombre = carpeta"
} else {
    Write-Host "$nombre no existe en $directorio"
}
$conPermiso = @($elementos | Where-Object { (Get-Acl $_.FullName).Access.FileSystemRights -match $permiso })
$conPermiso | ForEach-Object { Write-Host $_.Name }
Write-Host "Coincidencias con $permiso: $($conPermiso.Count)"