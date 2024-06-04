If (-not (Get-Module -ListAvailable -Name sqlserver)){
Write-Host "installing SqlServer module"
Install-Module -Name sqlserver -Force -ErrorAction Stop
}
else{Write-Host "SqlServer Module already present.."}

Write-Host "`nBacking up Stored Procedures.."

$Storage_path = ".\Command_SP"
$backup_location = ".\Command_SP\Backups\"
try {
    $SPs = Get-Content -Path ".\Command_SP\StoredProcedures.txt" -ErrorAction Stop
} catch {
    Write-Host "Could not get file or file contents. Please update the 'StoredProcedures.txt'" -ForegroundColor Yellow
    Start-Sleep -Seconds 3
    Read-Host "Hit enter to exit"
    exit
}

if (Test-Path $Storage_path) {
    Write-Host "Preliminaries ready.."
} else {
    New-Item -Path $Storage_path -ItemType Directory
}

if (Test-Path $backup_location) {
    Write-Host "Backup location ready.."
} else {
    New-Item -Path $backup_location -ItemType Directory
}

$DB_Server = Read-Host "Please enter the Database server name"
$instance = Read-Host "Please enter the Database instance name"

$Instance_Object = Get-SqlInstance -ServerInstance $instance
$All_Sps = $Instance_Object.Databases["Works"].StoredProcedures

foreach($SP in $SPs){
try{
$TargetSP = $All_Sps | Where-Object {$_.Name -eq "$SP"}
$TargetSP.script() | Out-File "$backup_location\$($TargetSP.Name).sql"
Write-Host "$($TargetSP.Name) Successfully backed up." -ForegroundColor Green -ErrorAction Continue
}
catch{Write-Host "$($TargetSP.Name) backup failed." -ForegroundColor Red}
}
powershell -noexit