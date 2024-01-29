Clear-Host

$Servers = Get-Content -Path "..\Servers.txt"

$location = 'C:\AHSINSTALL\TW\Misc'

function Folder_creation_stop{

foreach($Server in $Servers){

New-Item -Path "\\$server\C$\AHSINSTALL\TW" -Name Misc -ItemType Directory -ErrorAction SilentlyContinue
Remove-Item -Path "\\$Server\C$\AHSINSTALL\TW\Misc\StopServices.bat" -ErrorAction SilentlyContinue

try{
Copy-Item -Path ".\StopServices.bat" -Destination "\\$Server\C$\AHSINSTALL\TW\Misc"}

Catch{echo "`nFolder already present executing..."}

}
}

function stop_services{

Write-Host "`nStopping services on:`n*********************" -ForegroundColor Cyan
($Servers.split(' '))

Invoke-Command -ComputerName $Servers -ScriptBlock{Set-Location $using:location
&.\"StopServices.bat"
}

Write-Host "`nCompleted stopping services on:`n******************************" -ForegroundColor Green
($Servers.split(' '))
}

function Stop_service_intitation{

Folder_creation_stop
Stop_services
}

#*******************************************************************************************************************

Clear-Host

function Folder_creation_start{

foreach($Server in $Servers){

New-Item -Path "\\$server\C$\AHSINSTALL\TW" -Name Misc -ItemType Directory -ErrorAction SilentlyContinue
Remove-Item -Path "\\$Server\C$\AHSINSTALL\TW\Misc\StartServices.bat" -ErrorAction SilentlyContinue

try{
Copy-Item -Path ".\StartServices.bat" -Destination "\\$Server\C$\AHSINSTALL\TW\Misc"}

Catch{echo "`nFolder already present executing..."}

}
}

function start_services{

Write-Host "`nStarting services on:`n*********************" -ForegroundColor Cyan
($Servers.split(' '))

Invoke-Command -ComputerName $Servers -ScriptBlock{Set-Location $using:location
&.\"StartServices.bat"
}

Write-Host "`nCompleted starting services on:`n******************************" -ForegroundColor Green
($Servers.split(' '))
}

function Start_service_initiation{

Folder_creation_start
Start_services
}


function user{

Write-Host "`nSTART/STOP TWServices`n*********************"

[int]$User_value = Read-Host "`n1.StartTW_Services`n2.StopTW_Services`n`nSelect the number to intiate the task"

if ($User_value -eq 1){

Start_service_initiation

}
elseif($User_value -eq 2){

$confirmation = Read-Host "Are you sure want to stop the TW services? [Y/N]"

if ($confirmation -eq 'Y'){
Stop_service_intitation
}
else{Write-Host "Terminating the program.." -ForegroundColor Red| Exit}
}
else{Write-Host "Please enter a valid input."}

}

user
Write-Host ""
powershell -noexit