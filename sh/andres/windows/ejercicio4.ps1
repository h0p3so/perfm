Clear-Host
$salida = "usuarios.txt"
$usuarios = @(Get-LocalUser | Where-Object { [int]($_.SID.Value.Split("-")[-1]) -ge 1000 })
$usuarios | ForEach-Object { "$($_.Name);$($_.Description)" } | Set-Content $salida
Get-Content $salida
Write-Output "Registros escritos en ${salida}: $($usuarios.Count)"
