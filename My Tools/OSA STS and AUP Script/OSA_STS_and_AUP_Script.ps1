cls

Write-Host "`nWelcome to certificates verification.." -ForegroundColor Yellow

function OSA{
Write-Host "`nHello listing OSA Certificates...." -ForegroundColor DarkCyan
$Servers = Get-Content -Path "..\Servers.txt"

foreach($Server in $Servers){

$Thumbprint = Invoke-Command -ComputerName $Server -ScriptBlock { (Get-ChildItem -Path "Cert:\LocalMachine\My" |  Where-Object {$_.Subject -like "*OSA*"}).Thumbprint}
$Expiry = Invoke-Command -ComputerName $Server -ScriptBlock  {(Get-ChildItem -Path "Cert:\LocalMachine\My" |  Where-Object {$_.Subject -like "*OSA*"}).NotAfter}

[PSCustomObject]@{
Server = "$Server        "
Thumbprint = $Thumbprint
Validity = $Expiry
}
}
}

function STS{

Write-Host "`nHello listing STS Certificates...." -ForegroundColor DarkCyan
$Servers = Get-Content -Path "..\Servers.txt"
foreach($Server in $Servers){

$Thumbprint = Invoke-Command -ComputerName $Server -ScriptBlock { (Get-ChildItem -Path "Cert:\LocalMachine\My" |  Where-Object {$_.Subject -like "*STS*"}).Thumbprint}
$Expiry = Invoke-Command -ComputerName $Server -ScriptBlock  {(Get-ChildItem -Path "Cert:\LocalMachine\My" |  Where-Object {$_.Subject -like "*STS*"}).NotAfter}

[PSCustomObject]@{
Server = "$Server      "
Thumbprint = $Thumbprint
Validity = $Expiry
}
}
}

function AUP{

Write-Host "`nHi listing AUP Certificates...." -ForegroundColor DarkCyan
$Servers = Get-Content -Path "..\Servers.txt"
foreach($Server in $Servers){

$Thumbprint = Invoke-Command -ComputerName $Server -ScriptBlock { (Get-ChildItem -Path "Cert:\LocalMachine\My" |  Where-Object {$_.Subject -like "*AUP*"}).Thumbprint}
$Expiry = Invoke-Command -ComputerName $Server -ScriptBlock  {(Get-ChildItem -Path "Cert:\LocalMachine\My" |  Where-Object {$_.Subject -like "*AUP*"}).NotAfter}

[PSCustomObject]@{
Server = "$Server      "
Thumbprint = $Thumbprint
Validity = $Expiry
}
}
}

$user = Read-Host "`n1.OSA`n2.STS`n3.AUP`n`nChoose the certificate"
$user = $user.ToUpper()

if($user -eq '1'){
OSA
}
elseif($user -eq '2'){
STS
}
elseif($user -eq '3'){
AUP
}
else{Write-Host "`nInvalid Operation."}

echo ""

powershell -noexit