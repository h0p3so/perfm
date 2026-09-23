Clear-Host
$archivo = "C:\Windows\System32\drivers\etc\hosts"
$conteo = Get-Content $archivo | Measure-Object -Line -Word
$bytes = (Get-Item $archivo).Length
Write-Output "El numero de lineas del archivo $archivo es: $($conteo.Lines)"
Write-Output "El numero de palabras es: $($conteo.Words)"
Write-Output "El tamano en bytes es: $bytes"
Write-Output "Primeras cinco lineas:"
Get-Content $archivo -TotalCount 5
