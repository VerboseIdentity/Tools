function Service-identification{

param ( 
        $service1,
        $service2 )

$Servers = Get-Content -Path "..\Servers.txt"

Write-Host "`nChecking Support one server .....`n" -ForegroundColor Yellow

ForEach($Server in $Servers){

$Services = Get-Service -ComputerName $Server -Name $service1, $service2 -ErrorAction SilentlyContinue

if ($Services -ne $null){
Write-Host "[$Server] Support one server identified" -ForegroundColor Green
}
else{
Write-Host "[$Server] is not a Support one server" -ForegroundColor Red
}
}

}

Service-identification -service1 "NextNine Site Server" -service2 "NextNine Site Server Watchdog"

Write-Host

powershell -noexit
