Clear-Host

function dir_check{

Write-Host "`nChecking latest patch installation"
echo "*********************************`n"
$Servers = Get-Content -Path "..\Servers.txt"

foreach($Server in $Servers){

try{

$patchstatus = Invoke-Command -ComputerName $Server -ScriptBlock {Get-ItemProperty "HKLM:\SOFTWARE\WOW6432Node\Allscripts\TouchWorks"} -ErrorAction Stop

Write-Host "Web patch installed on [$Server] :     " $patchstatus.PatchVersionWeb
Write-Host "Message patch installed on [$Server] : " $patchstatus.PatchVersionMessageCenter

}
catch{Write-Host "Patch 5 not installed on [$Server]" -ForegroundColor Red}
echo ""
}
}

dir_check

echo ""
powershell -noexit