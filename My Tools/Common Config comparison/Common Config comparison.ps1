Clear-Host

Write-Host "`nHello !! Comparing Common Config files..." -ForegroundColor DarkYellow

$Servers = Get-Content -Path "..\Servers.txt"

$CommonConfig = Get-Content -Path "C:\inetpub\wwwroot\SecurityAgentService\Config\CommonConfiguration.config"

foreach($Server in $Servers){
Try{
$Targetfile = Invoke-Command -ComputerName $Server -ScriptBlock {Get-Content -Path "C:\inetpub\wwwroot\SecurityAgentService\Config\CommonConfiguration.config"} -ErrorAction Stop
}
Catch{Write-Output `n$Server $_.Exception.Message}
If($Targetfile -eq $null){Write-Host "$Server $_.Exception.Message terminating execution on this server" -ForegroundColor Red}
else{
$Teda = Compare-Object -ReferenceObject $CommonConfig -DifferenceObject $Targetfile

If($Teda -eq $null)
{

Write-Host "`nGood to go on [$Server]" -ForegroundColor Green

}
else
{

Write-Host "`nCommon Config File doesn't match on [$Server]" -ForegroundColor Red

}
}
}

Read-Host "`nHit enter to exit"