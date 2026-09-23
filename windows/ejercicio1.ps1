Clear-Host
Write-Output "Hello World from Shell"
Write-Output "Sistema operativo: $((Get-CimInstance Win32_OperatingSystem).Caption)"
Write-Output "Equipo: $(hostname)"
Write-Output "Usuario: $(whoami)"
Write-Output "Fecha y hora: $(Get-Date)"
