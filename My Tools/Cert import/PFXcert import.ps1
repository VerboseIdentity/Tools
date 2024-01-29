$Certpwd = Read-Host "Enter the Certificate password" -AsSecureString

$Servers = Get-Content -path "..\Servers.txt"
#C:\AHSINSTALL\TW\Misc

Foreach($Server in $Servers){

if (Test-Path "\\$Server\C$\AHSINSTALL\TW\Misc"){

Write-host 'Misc folder available, proceeding ...'
}
else{

New-Item -Path "\\$Server\C$\AHSINSTALL\TW" -Name Misc -ItemType Directory -ErrorAction SilentlyContinue
}

Remove-Item -Path "\\$Server\C$\AHSINSTALL\TW\Misc\PFX Certs" -Force -Recurse -ErrorAction SilentlyContinue

Copy-Item -Path ".\PFX Certs" -Destination "\\$Server\C$\AHSINSTALL\TW\Misc" -Recurse -Force -ErrorAction SilentlyContinue

$session = New-PSSession -ComputerName $Server

$Certs = Get-ChildItem -Path "\\$Server\C$\AHSINSTALL\TW\Misc\PFX Certs"

$Certs = $Certs.Name

foreach($Cert in $Certs){

$filepath = 'C:\AHSINSTALL\TW\Misc\PFX Certs\' + $Cert

Invoke-Command -Session $session -ScriptBlock {

Import-PFXCertificate -CertStoreLocation Cert:\LocalMachine\My -FilePath $using:filepath -Password $using:Certpwd
 
Import-PFXCertificate -CertStoreLocation Cert:\LocalMachine\TrustedPeople -FilePath $using:filepath -Password $using:Certpwd
 
Import-PFXCertificate -CertStoreLocation Cert:\LocalMachine\Root -FilePath $using:filepath -Password $using:Certpwd
    
}
}
Remove-PSSession $session
}

Write-host "`nCertificates imported ...!" -ForegroundColor Green

Powershell -noexit