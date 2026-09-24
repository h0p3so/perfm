Clear-Host
if ($args.Count -ne 2) {
    Write-Output "Uso: buscar_palabra.ps1 palabra archivo"
    exit 1
}
$palabra = $args[0]
$archivo = $args[1]
if (-not (Test-Path $archivo -PathType Leaf)) {
    Write-Output "Error: el archivo $archivo no existe o no tiene permiso de lectura"
    exit 2
}
try {
    $resultado = @(Select-String -Path $archivo -Pattern $palabra -ErrorAction Stop)
} catch {
    Write-Output "Error: el archivo $archivo no existe o no tiene permiso de lectura"
    exit 2
}
$resultado | ForEach-Object { Write-Output "$($_.LineNumber): $($_.Line)" }
Write-Output "Total de coincidencias: $($resultado.Count)"
