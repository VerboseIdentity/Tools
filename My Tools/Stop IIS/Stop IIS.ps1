Write-Host `n"Stopping IIS, Never perform this on PROD env unless on a Go-Live day"`n -ForegroundColor Red

$result = Read-Host "Are you sure want to continue ? [Yes | No]"

$Servers = Get-Content "..\Servers.txt"

if($result -eq 'Yes'){
foreach($Server in $Servers){
Write-Host `n"Attemting on $Server.." -ForegroundColor DarkGray
Invoke-Command -ComputerName $Server -ScriptBlock{IISRESET /stop}
$Completion += "Completed on $Server`n"
}
}
else{Write-Host `n"Thank you." -ForegroundColor Yellow}
Write-Host "$Completion" -ForegroundColor Green

Powershell -noexit