Clear-Host

$Servers = Get-Content -Path "..\Servers.txt"

If(Test-Path -Path ".\Service_Accounts.txt"){

$Credentials = Get-Content -Path ".\Service_Accounts.txt"

foreach($Server in $Servers){
$Header = "Testing Connection on [$Server]"
Write-Host "$Header`n$('-' * $Header.Length)"
foreach($Credential in $Credentials){
$username = $Credential.split(",")[0]
$password = $Credential.split(",")[1]

$securePassword = ConvertTo-SecureString -String $password -AsPlainText -Force
$credentials = New-Object System.Management.Automation.PSCredential -ArgumentList $username, $securePassword

$Output = Invoke-Command -ComputerName $Server -Credential $credentials -ScriptBlock { ipconfig }

if($Output){

Write-Host "Connected Successfully with [$username]" -ForegroundColor Green
}
else
{Write-Host "Unable to connect with [$username]" -ForegroundColor Red}
}
Write-Host ""
}
}
else{
New-Item -Path '.\' -Name "Service_Accounts.txt" -ItemType File
Write-Host "`nPlease enter the  credentials in Service_Accounts file."
}

Powershell -noexit