$nombres = @("usuario1", "usuario2", "usuario3")
foreach ($usuario in $nombres) {
    New-LocalUser -Name $usuario -Description "Cuenta de practica $usuario" -NoPassword
    Write-Host "Creado: $usuario"
}