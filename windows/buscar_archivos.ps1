Clear-Host
if ($args.Count -ne 2) {
    Write-Output "Uso: buscar_archivos.ps1 directorio permiso"
    exit 1
}
$directorio = $args[0]
$permiso = $args[1]
if (-not (Test-Path $directorio -PathType Container)) {
    Write-Output "Error: el directorio $directorio no existe o no se puede leer"
    exit 2
}
try {
    $contenido = Get-ChildItem $directorio -File -ErrorAction Stop
} catch {
    Write-Output "Error: el directorio $directorio no existe o no se puede leer"
    exit 2
}
$nombre = Read-Host "Nombre a buscar en $directorio"
$ruta = Join-Path $directorio $nombre
if (Test-Path $ruta -PathType Leaf) {
    Write-Output "$nombre es un archivo"
} elseif (Test-Path $ruta -PathType Container) {
    Write-Output "$nombre es un subdirectorio"
} else {
    Write-Output "$nombre no existe en $directorio"
}
Write-Output "Archivos con permiso $permiso en ${directorio}:"
$archivos = @($contenido | Where-Object {
    (Get-Acl $_.FullName).Access | Where-Object { $_.FileSystemRights -match $permiso }
})
$archivos | ForEach-Object { Write-Output $_.Name }
Write-Output "Total de archivos encontrados: $($archivos.Count)"
