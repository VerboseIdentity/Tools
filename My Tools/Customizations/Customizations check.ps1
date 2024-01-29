Clear-Host

Write-Host "`nChecking customizations files available availability ....`n"
$Servers = Get-Content -Path '..\Servers.txt'
$RPTs = Get-ChildItem -Path ".\RPT files"
$RPTrefined = $RPTs.Name

foreach($Server In $Servers){

$Get = Invoke-Command -ComputerName $Server -ScriptBlock{

Get-Childitem -Path "C:\Program Files (x86)\Common Files\Allscripts\Reports"} -ErrorAction SilentlyContinue
foreach($RPT in $RPTrefined){
$cond = $Get | Where-Object {$_.Name -eq $RPT} | Select LastWriteTime, Length, Name, PSComputerName | Format-Table

If($cond -eq $null){Write-Host "$RPT is not available on $Server" -ForegroundColor Red}

else{
Write-Host "`n$RPT Available on $Server :" -ForegroundColor Green
$cond
}
}
}
echo "`nSearch completed."

Read-Host -Prompt "`nHit enter to exit"