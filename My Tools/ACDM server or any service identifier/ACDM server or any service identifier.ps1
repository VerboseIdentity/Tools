cls
$selection = Read-Host "`nThis script by default searches for ACDM service, to continue with ACDM select [Yes] | if you want to search for any other service select [No]"
$Servers = Get-Content -Path "..\Servers.txt"

function Services {

Write-Host "`nChecking ACDM server ..."

foreach($Server in $Servers){
$ACDM_Service = Get-Service -ComputerName $Server -DisplayName 'Allscripts IHE Gateway Adapter*' -ErrorAction SilentlyContinue

if ($ACDM_Service -ne $null -and $ACDM_Service.status -eq 'Running'){
$status = $ACDM_Service.status
Write-Host "`n[$ACDM_Service] found [$status] on $Server" -ForegroundColor Yellow
$Status_decision = Read-Host "`nWould you like to stop the service ? [Yes | No]"

if ($Status_decision -eq 'Yes'){Get-Service -ComputerName $Server -Name 'Allscripts IHE Gateway Adapter*' | Stop-Service 
Set-Service -Name $ACDM_Service.name -ComputerName $Server -StartupType Disabled

Write-Host "`n[$ACDM_Service] stopped and disabled on $Server"}elseif($Status_decision -eq 'No'){$null}else{Write-Host "`nEnter a valid input."}
}
elseif($ACDM_Service -ne $null -and $ACDM_Service.status -eq 'Stopped'){$status = $ACDM_Service.status
Write-Host "`n[$ACDM_Service] found [$status] on $Server" -ForegroundColor Yellow}
else{
Write-Host "`nIHE Gateway Adapter not found on $Server" -ForegroundColor Red

}
}
Write-Host ""
}

# Global service identification
###############################

Function Global{

param ([string[]]$Service)

Write-Host "`nInitiating informational seach for $Service"
foreach($Server in $Servers){
$Target_Service = Get-Service -ComputerName $Server -DisplayName $Service -ErrorAction SilentlyContinue

if ($Target_Service -ne $null -and $Target_Service.Status -eq 'Running'){
$name = $Target_Service.DisplayName
$status = $Target_Service.Status
Write-Host "`n[$name] found [$status] on $Server" -ForegroundColor Yellow
$Servers_on_service_running += $Server}

elseif($Target_Service -ne $null -and $Target_Service.Status -eq 'Stopped'){
$name = $Target_Service.DisplayName
$status = $Target_Service.Status
Write-Host "`n[$name] found [$status] on $Server" -ForegroundColor Cyan
}

else{
Write-Host "`n[$Custom_Service_Name] not found on $Server" -ForegroundColor Red
}
}


if ($Servers_on_service_running -ne $null){

$Status_decision = Read-Host "`nWould you like to stop the service ? [Yes | No]"

if($Status_decision -eq 'Yes' -or $Status_decision -eq 'Y'){foreach($Each_service_active_server in $Servers_on_service_running){

$Service_Name = Get-Service -ComputerName $Each_service_active_server -DisplayName $Service
$Service_Name | Stop-Service -Force
Set-Service -Name $Service_Name.Name -StartupType Disabled -ComputerName $Each_service_active_server

Write-Host "`n[$Service] stopped and disabled on $server" -ForegroundColor Green}

Write-Host ""
}
elseif($Status_decision -eq 'No' -or $Status_decision -eq 'N'){Write-Host "`nTerminating the proceedure"}
else{Write-Host "`nEnter a valid input."}
}
}


#Calling
########

if ($selection -eq 'Yes' -or $selection -eq 'Y'){
Services
}
elseif($selection -eq 'No' -or $selection -eq 'N'){

$Custom_Service_Name = Read-Host "`nEnter the name of the service"
Global -Service $Custom_Service_Name
}
else{
Write-Host "`nPlease enter a Valid input.`n"
}

Write-Host ""

powershell -noexit
