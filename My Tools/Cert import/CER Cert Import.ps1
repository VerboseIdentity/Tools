#$Certpwd = Read-Host "Enter the Certificate password" -AsSecureString

Write-Host "Importing AUP Certificate .." -ForegroundColor Yellow

$Servers = Get-Content -path "..\Servers.txt"


Foreach($Server in $Servers){


Invoke-Command -ComputerName $Server -ScriptBlock{ New-Item -Path "C:\AHSINSTALL\TW" -ItemType Directory -Name 'Misc' -ErrorAction SilentlyContinue}

Remove-Item -Path "\\$Server\C$\AHSINSTALL\TW\Misc\CER Certs" -Force -Recurse -ErrorAction SilentlyContinue
Copy-Item -Path ".\CER Certs" -Destination "\\$Server\C$\AHSINSTALL\TW\Misc" -Recurse -Force -ErrorAction SilentlyContinue

$session = New-PSSession -ComputerName $Server

$Certs = Get-ChildItem -Path "\\$Server\C$\AHSINSTALL\TW\Misc\CER Certs"

$Certs = $Certs.Name

foreach($Cert in $Certs){

$filepath = 'C:\AHSINSTALL\TW\Misc\CER Certs\' + $Cert

Invoke-Command -Session $session -ScriptBlock {

Import-Certificate -CertStoreLocation Cert:\LocalMachine\My -FilePath $using:filepath
 
Import-Certificate -CertStoreLocation Cert:\LocalMachine\TrustedPeople -FilePath $using:filepath
    
}
}
Remove-PSSession $session
}

Write-host "`nCertificates imported ...!" -ForegroundColor Green

Powershell -noexit