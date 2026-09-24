Clear-Host
$archivo = "C:\Windows\System32\drivers\etc\hosts"
$lineas = Get-Content $archivo
$stats = $lineas | Measure-Object -Line -Word
Write-Host "Lineas: $($stats.Lines) | Palabras: $($stats.Words) | Bytes: $((Get-Item $archivo).Length)"
Write-Host "Primeras 5:"
$lineas | Select-Object -First 5