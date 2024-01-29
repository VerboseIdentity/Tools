Clear-Host

Write-Host "`nPreparing for adding permissions on remote servers for OSA and STS cers.."

$Servers = Get-Content -Path "..\Servers.txt"

$location = "C:\AHSINSTALL\TW\Misc"

Foreach ($Server in $Servers){

If(Test-Path -Path "\\$Server\C$\AHSINSTALL\TW\Misc"){

Remove-Item -Path "\\$Server\C$\AHSINSTALL\TW\Misc\Cert Permissions_Main.ps1" -ErrorAction SilentlyContinue

Copy-Item -Path ".\Cert Permissions_Main.ps1" -Destination "\\$Server\C$\AHSINSTALL\TW\Misc"

Echo "`nPreliminaries set."


}
else{

New-Item -Path "\\$Server\C$\AHSINSTALL\TW" -Name Misc -ItemType Directory

Copy-Item -Path ".\Cert Permissions_Main.ps1" -Destination "\\$Server\C$\AHSINSTALL\TW\Misc"

}

Invoke-Command -ComputerName $Server -ScriptBlock {Set-Location $using:location

&.\"Cert Permissions_Main.ps1"}


Write-Host "`nPermissions added on $Server" -ForegroundColor Green

}
echo ""
Powershell -noexit