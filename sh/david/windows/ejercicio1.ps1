Clear-Host
Write-Host "Hello World from Shell"
Write-Host "Sistema: $((Get-CimInstance Win32_OperatingSystem).Caption)"
Write-Host "Equipo: $env:COMPUTERNAME"
Write-Host "Usuario: $env:USERNAME"
Write-Host "Hora: $(Get-Date -Format 'dd/MM/yyyy HH:mm')"