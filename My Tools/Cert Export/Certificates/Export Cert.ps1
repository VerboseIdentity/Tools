Clear-Host

Write-Host "`nCertificate export script ...`n"

$Thumprint = Read-Host "Please enter the thumprint of the certificate to export "

$Certlocation = 'Cert:\LocalMachine\My\'

$Certificate = $Certlocation + $Thumprint

$Pass = ConvertTo-SecureString -String 'Allscripts#1' -AsPlainText -Force

Try{
$Identified = Get-ChildItem -Path Cert:\LocalMachine\My\$Thumprint

$CertName = $Identified.GetName()

Export-PfxCertificate -FilePath ".\$CertName.pfx" -Cert $Identified -Password $Pass -Verbose -ErrorAction Stop

Write-Host "`nExport Completed..!" -ForegroundColor Green
}
catch
{
Write-Host $_.Exception.Message
}
Read-Host -Prompt "`nHit enter to exit"