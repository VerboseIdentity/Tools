$Certpwd = Read-Host "Enter the Certificate password" -AsSecureString

$Servers = Get-Content -path "..\Servers.txt"

foreach($Server in $Servers) {
    if (Test-Path "\\$Server\C$\AHSINSTALL\TW\Misc") {
        Write-Host 'Misc folder available, proceeding ...'
    } else {
        New-Item -Path "\\$Server\C$\AHSINSTALL\TW" -Name Misc -ItemType Directory -ErrorAction SilentlyContinue
    }

    Remove-Item -Path "\\$Server\C$\AHSINSTALL\TW\Misc\PFX Certs" -Force -Recurse -ErrorAction SilentlyContinue

    Copy-Item -Path ".\PFX Certs" -Destination "\\$Server\C$\AHSINSTALL\TW\Misc" -Recurse -Force -ErrorAction SilentlyContinue

    $session = New-PSSession -ComputerName $Server

    $Certs = Get-ChildItem -Path "\\$Server\C$\AHSINSTALL\TW\Misc\PFX Certs"

    foreach($Cert in $Certs) {
        $filepath = "\\$Server\C$\AHSINSTALL\TW\Misc\PFX Certs\$Cert"

        Invoke-Command -Session $session -ScriptBlock {
            param ($filepath, $Certpwd)
            
            Import-PFXCertificate -CertStoreLocation Cert:\LocalMachine\My -FilePath $filepath -Password $Certpwd -Exportable
            Import-PFXCertificate -CertStoreLocation Cert:\LocalMachine\TrustedPeople -FilePath $filepath -Password $Certpwd -Exportable
            Import-PFXCertificate -CertStoreLocation Cert:\LocalMachine\Root -FilePath $filepath -Password $Certpwd -Exportable

        } -ArgumentList $filepath, $Certpwd
    }
    
    Remove-PSSession $session
}

Write-Host "`nCertificates imported ...!" -ForegroundColor Green

powershell -noexit
