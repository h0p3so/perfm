Clear-Host
$salida = "usuarios.txt"
$usuarios = @(Get-LocalUser | Where-Object { [int]($_.SID.Value -split '-')[-1] -ge 1000 })
$usuarios | ForEach-Object { '{0};{1}' -f $_.Name, $_.Description } | Set-Content $salida
Get-Content $salida
Write-Host "Guardados en $salida: $($usuarios.Count)"