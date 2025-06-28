param(
    [string]$Region,
    [string]$EnvType
)

$data = Get-Content "C:\Users\Carlo\Documents\Pruebas\Azure-Actions\actions-azure\.github\variables\testing.json" -Raw | ConvertFrom-Json 
Write-Output $data.$Region.$EnvType.prefix

$secrets = $data.$Region.$EnvType.secrets

foreach ($secret in $secrets) {
    Write-Output $secret
}