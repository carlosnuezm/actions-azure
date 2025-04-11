param(
    [string]$ComputerName,
    [string]$Username,
    [string]$Password
)

# Crear credenciales seguras
$securePassword = ConvertTo-SecureString $Password -AsPlainText -Force
$credentials = New-Object System.Management.Automation.PSCredential($Username, $securePassword)

# Crear la sesión remota
$session = New-PSSession -ComputerName $ComputerName -Credential $credentials

# Acción 1: Copiar archivos
Copy-Item -Path "C:\test" -Destination "C:\results" -Recurse -ToSession $session

# Acción 2: Ejecutar comandos remotos
Invoke-Command -Session $session -ScriptBlock {
    # Aquí puedes meter lo que necesites
    Write-Output "Archivos en C:\results:"
    Get-ChildItem "C:\results"
}

# Acción 3: Más comandos
Invoke-Command -Session $session -ScriptBlock {
    # Otros comandos que quieras correr
    Write-Output "Todo bien en este servidor."
}

# Limpiar sesión
Remove-PSSession $session