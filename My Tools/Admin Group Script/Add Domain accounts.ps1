Cls

$Servers = Get-Content -Path "..\Servers.txt"
$Accounts = Get-Content -Path ".\User Accounts.txt"

foreach($Server In $Servers){
$Avlaccounts = Invoke-Command -ComputerName $Server -ScriptBlock{net localgroup Administrators}
Write-Host "`n*********** $Server ************`n"
foreach($Account in $Accounts){

If($Avlaccounts -contains $Account){Write-Host $Account "is available in the admin group." -ForegroundColor Gray}
else{
Invoke-Command -ComputerName $Server -ScriptBlock {Add-LocalGroupMember -Group Administrators -Member $Using:Account -ErrorAction SilentlyContinue}
Write-Host $Account "added to the admin group." -ForegroundColor Green
}
}
}
Echo ''
Powershell -noexit