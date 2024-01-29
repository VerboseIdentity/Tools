Write-Host "Connecting to SQL server with credentials"

$DB_server = Read-Host "Please enter the DB server Name"
$Instance = Read-Host "Please enter the Database Instance name"
$Global:Query = "Select @@Version"

try{
New-Item -Path '.\' -Name Sql_Credentails -ItemType file -ErrorAction SilentlyContinue
}
catch{
Write-Host "Preliminaries set proceeding..."}

function Connection($UserID, $Password, $Instance){

$output = Invoke-Command -ComputerName $DB_server -ScriptBlock{
Invoke-Sqlcmd -ServerInstance $Using:Instance -Username $Using:UserID -Password $Using:Password -Query $Using:Query -ErrorAction SilentlyContinue
} -ErrorAction SilentlyContinue
if($output){
Write-Host "Successfully connected to the SQL instance with $UserID" -ForegroundColor Green
}
else{
Write-Host "Failed connecting to the SQL instance with $UserID" -ForegroundColor Red}
}

$Credentials = Get-Content -Path '.\Sql_Credentails'
foreach($Credential in $Credentials){
$Cred = $Credential.split(',')
$User = $Cred[0]
$pin = $Cred[1]
Connection -UserID $User -Password $pin -Instance $Instance
}
