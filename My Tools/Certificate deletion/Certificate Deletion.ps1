Clear-Host

Write-Host "`nCertificates deletion script initiated" -ForegroundColor Yellow

$Servers = Get-Content -Path "..\Servers.txt"

$InputThumbprint = Read-Host "`nEnter the certificate's Thumprint that needs to be deleted"

foreach($Server in $Servers){

$Check = Invoke-Command -ComputerName $Server -ScriptBlock{

Get-ChildItem -Path Cert:\LocalMachine\My | Where-Object {$_.Thumbprint -eq $Using:InputThumbprint}
Get-ChildItem -Path Cert:\LocalMachine\Root | Where-Object {$_.Thumbprint -eq $Using:InputThumbprint}
Get-ChildItem -Path Cert:\LocalMachine\TrustedPeople | Where-Object {$_.Thumbprint -eq $Using:InputThumbprint}}

if($Check -eq $null){

Write-Host "Certificate with Thumbprint $InputThumbprint is not available on $Server" -ForegroundColor Red
}
else{
Write-Host "Removing certificate with thumbprint $InputThumbprint on $Server"

$Exe = Invoke-Command -ComputerName $Server -ScriptBlock{

Get-ChildItem -Path Cert:\LocalMachine\My | Where-Object {$_.Thumbprint -eq $Using:InputThumbprint} | Remove-Item
Get-ChildItem -Path Cert:\LocalMachine\Root | Where-Object {$_.Thumbprint -eq $Using:InputThumbprint} | Remove-Item
Get-ChildItem -Path Cert:\LocalMachine\TrustedPeople | Where-Object {$_.Thumbprint -eq $Using:InputThumbprint} | Remove-Item}
Write-Host "Removed certificate with thumbprint $InputThumbprint on $Server" -ForegroundColor Green
}
}
Write-Host "`nTask completed" -ForegroundColor Green

Read-Host -Prompt "Hit enter to exit"
