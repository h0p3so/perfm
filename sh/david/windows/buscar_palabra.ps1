Clear-Host
if ($args.Count -ne 2) {
    Write-Host "Uso: buscar_palabra.ps1 <palabra> <archivo>"
    exit 1
}
$palabra, $archivo = $args
if (-not (Test-Path $archivo -PathType Leaf)) {
    Write-Host "Error: $archivo no existe o no es legible"
    exit 2
}
Select-String -Path $archivo -Pattern $palabra | ForEach-Object { Write-Host "$($_.LineNumber): $($_.Line)" }
Write-Host "Coincidencias: $((Select-String -Path $archivo -Pattern $palabra).Count)"