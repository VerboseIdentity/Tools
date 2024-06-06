# Ensure the SqlServer module is installed and loaded
if (-not (Get-Module -ListAvailable -Name SqlServer)) {
    Install-Module -Name SqlServer -AllowClobber -Force
}
Import-Module SqlServer

# Define the server name and database name
$serverName = Read-Host "Please enter the database Instance name"
$databaseName = "Works"
$SPs = Get-Content -Path ".\Command_SP\StoredProcedures.txt"
$BackedupSps = Get-Content -Path ".\Command_SP\BackedUpSps.txt"

foreach($SP in $SPs){
    $date = Get-Date -Format "dd-MM-yyyy_HH-mm"

    # Rename the stored procedure
    $renameQuery = @"
    EXEC sp_rename '$databaseName.dbo.$SP', '$SP_$date'
    "@

    Invoke-Sqlcmd -ServerInstance $serverName -Database $databaseName -Query $renameQuery
    Write-Host "Stored procedure renamed successfully to '$SP_$date'!" -ForegroundColor DarkGreen

    # Restore the stored procedure if it exists in the backup list
    if ($BackedupSps -contains $SP) {
        $backupFilePath = ".\Command_SP\Backups-Restores\$SP.sql"
        if (Test-Path $backupFilePath) {
            $RestoreSP = Get-Content -Path $backupFilePath -Raw

            # Split the SQL script into individual batches
            $batches = $RestoreSP -split "GO"
            foreach ($batch in $batches) {
                if ($batch.Trim()) {
                    Invoke-Sqlcmd -ServerInstance $serverName -Database $databaseName -Query $batch.Trim()
                }
            }

            Write-Host "Stored procedure '$SP' restored successfully!" -ForegroundColor DarkGreen
        } else {
            Write-Host "Backup file for '$SP' not found at '$backupFilePath'." -ForegroundColor Red
        }
    }
}
