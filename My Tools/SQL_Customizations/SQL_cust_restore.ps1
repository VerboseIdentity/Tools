if (-not (Get-Module -ListAvailable -Name SqlServer)) {
    Install-Module -Name SqlServer -AllowClobber -Force
}
Import-Module SqlServer

$Header = "`nSQL Customizations restore`n"
Write-Host "$Header$('-' * $Header.Lenght)" -ForegroundColor Cyan

$databaseName = "Works"
$SPs = Get-Content -Path ".\Command_SP\StoredProcedures.txt"
$BackedupSps = ".\Command_SP\Backups-Restores"
$instance = Read-Host "Please enter the Database instance name"

foreach($SP in $SPs){
    $date = Get-Date -Format "dd-MM-yyyy HH:mm"
    $Rename = $SP + '_' + $date
    $renameQuery = @"
EXEC sp_rename '$databaseName.dbo.$SP', '$Rename'
"@
    Invoke-Sqlcmd -ServerInstance $instance -Query $renameQuery -Database $databaseName
    $backupFile = "$BackedupSps\$SP.sql"
    if (Test-Path $backupFile) {
        $query = Get-Content -Path $backupFile -Raw
        Invoke-Sqlcmd -ServerInstance $instance -Query $query -Database $databaseName
        Write-Host "$SP applied successfully!" -ForegroundColor Green
    } else {
        Write-Host "Backup for stored procedure '$SP' not found!" -ForegroundColor Yellow
    }
}
