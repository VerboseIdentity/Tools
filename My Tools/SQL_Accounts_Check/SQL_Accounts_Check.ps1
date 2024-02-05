Clear-Host

Write-Host "Connecting to the SQL Server..`n"

$DB_Server = Read-Host "Please Enter theDB server Name"
$Instance = Read-Host "Please enter the Database Instance name"
$Global:Query = "Select @@VERSION"

try {
    New-Item -Path ".\" -Name SQL_Credentials.txt -ItemType File -ErrorAction SilentlyContinue
}
catch {
    Write-Host "Preliminaries set proceeding..."
}

function Connection ($UserID, $Password, $Instance){
    $output = Invoke-Command -ComputerName $DB_Server -ScriptBlock{
        Invoke-Sqlcmd -ServerInstance $Using:Instance -Username $Using:UserID -Password $Using:Password -Query $Using:Query -ErrorAction SilentlyContinue
    } -ErrorAction SilentlyContinue
    if ($output) {
        Write-Host "Successfully Connected to the SQL instance with : $UserID" -ForegroundColor Green
    }
    else {
        Write-Host "Failed connecting to the SQL instance with : $UserID" -ForegroundColor Red
    }
}

$Credentials = Get-Content -Path ".\SQL_Credentials.txt"
foreach($Credential in $Credentials){
    $Cred = $Credential.split(",")
    $User = $Cred[0]
    $pin = $Cred[1]
    Connection -UserID $User -Password $pin -Instance $Instance
}