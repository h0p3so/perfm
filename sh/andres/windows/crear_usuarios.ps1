foreach ($usuario in "usuario1", "usuario2", "usuario3") {
    New-LocalUser -Name $usuario -Description "Usuario de prueba $usuario" -NoPassword
    Write-Output "Usuario $usuario creado"
}
