Clear-host

$Servers = Get-Content -Path '..\Servers.txt'

Write-Host "Performing IIS Reset on:`n************************" -ForegroundColor DarkYellow
$Servers

Invoke-Command -ComputerName $Servers -ScriptBlock { iisreset.exe }

Write-Host "Reset Completed on:`n*******************" -ForegroundColor Green
$Servers 

Read-Host "`nHit Enter to Exit"