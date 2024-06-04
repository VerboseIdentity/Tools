Write-Host "`nBacking up Stored_procedures.."

$Storage_path = ".\Command_SP"
try{
$Sps = Get-Content -Path ".\Command_SP\StoredProcedures.txt" -ErrorAction Stop
}
catch{
Write-Host "Could not get file or file contents. Please update the 'StoredProcedures.txt'" -ForegroundColor Yellow
Start-Sleep -Seconds 3
Read-Host "Hit enter to exit"
exit
}
if(Test-Path $Storage_path){Write-Host "Preliminaries ready.."}else{New-Item -Path $Storage_path -ItemType Directory}

$DB_Server = Read-Host "Please enter the Database server name"
$instance = Read-Host "Please enter the Database instance name"

foreach($SP in $SPs){
Invoke-Command -ComputerName $DB_Server -ScriptBlock{
$Instance = Get-sqlInstance -ServerInstance "$Using:instance"
$Sps = $Instance.Databases["Works"].StoredProcedures
}
$TargetSP = $Sps | Where-Object {$_.Name -eq "$SP"}
$TargetSP.script() | Out-File "$Storage_path\$($TargetSP.Name).sql"
}
Powershell -noexit