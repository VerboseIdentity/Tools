Clear-Host

Write-Host "`nSearch initiated for Delta, Clinevolve and ATP Server identification" -f Yellow
echo "This might take a minute"
$Servers = Get-Content -Path "..\Servers.txt"
Foreach($Server in $Servers){

$Delta = Invoke-Command -ComputerName $Server -ScriptBlock {
Get-Service DeltaService} -ErrorAction SilentlyContinue

$ATP = Invoke-Command -ComputerName $Server -ScriptBlock{
Get-Service *SymedicalServerBackgroundProcessor*,*SymedicalServerDistribution*} -ErrorAction SilentlyContinue
$ATPver = Invoke-Command -ComputerName $Server -ScriptBlock{Get-ItemProperty 'HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*' | where Publisher -Like '*Clinical Architecture LLC*'| Select-Object DisplayName, Publisher,DisplayVersion | Sort-Object DisplayName | Format-Table DisplayName, Publisher,DisplayVersion
}

$Unity = Invoke-Command -ComputerName $Server -ScriptBlock{Get-IISAppPool | Select-Object Name | where Name -Like *UnityAppPool*} -ErrorAction SilentlyContinue
 
 If($Delta -ne $null){
 Write-Host "`n$Server is the Delta Server`n" -ForegroundColor Green
}

If($ATP -ne $null){
Write-Host "$Server is an ATP Server" -ForegroundColor Green
$ATPver
}

If($Unity -ne $null){
Write-Host "$Server is a Unity Server" -ForegroundColor Green
$Unity} 

}

Powershell -noexit