Clear-Host

Write-Host "`nHello !! Comparing ShieldConfiguration files..." -ForegroundColor DarkYellow

$Servers = Get-Content -Path "..\Servers.txt"

$OrgShieldConfig = Get-Content -Path "C:\inetpub\wwwroot\ISAPI\ShieldConfiguration.config"

foreach($Server in $Servers){
Try{
$Targetfile = Invoke-Command -ComputerName $Server -ScriptBlock {Get-Content -Path "C:\inetpub\wwwroot\ISAPI\ShieldConfiguration.config"}-ErrorAction Stop}
Catch{Write-Output `n$Server $_.Exception.Message}
if($Targetfile -eq $null){Write-Host "`n$Server $_.Exception.Message Terminating the execution on this server" -ForegroundColor Red}
else{
$Teda = Compare-Object -ReferenceObject $OrgShieldConfig -DifferenceObject $Targetfile

If($Teda -eq $null)
{

Write-Host "`nGood to go on $Server" -ForegroundColor Green

}
else
{

Write-Host "`nShield Config File doesn't match on $Server" -ForegroundColor Red
}

}

}
Read-Host "`nHit enter to exit"
