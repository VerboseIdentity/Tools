cls

echo "`nPlacing Customizations files ....."

$Servers = Get-Content -Path "..\Servers.txt"

$Customizationfiles = Get-ChildItem -Path ".\RPT files"

$TargetCust = 'C$\Program Files (x86)\Common Files\Allscripts\Reports'

$Onmachine = 'C:\Program Files (x86)\Common Files\Allscripts\Reports\'

$Customfilenames = $Customizationfiles.Name

$Date = Get-Date -Format "ddMMyyyy"

foreach($Server in $Servers){
Write-Host "`n***************** $Server ******************" -ForegroundColor Yellow
foreach($RPT in $Customfilenames){

if(Test-Path -Path "\\$Server\$TargetCust"){

$Orgfile = Get-ChildItem -Path "\\$Server\$TargetCust" | Where-Object {$_.Name -EQ $RPT} -ErrorAction SilentlyContinue
$fileonmachine = '.\RPT files\' + $RPT

if($Orgfile -eq $null){
Write-Host "'$RPT' File not found, copy initialised" -ForegroundColor Magenta

Try {Copy-Item -path $fileonmachine -Destination "\\$Server\$TargetCust" -ErrorAction Stop}
catch{Write-Host $_.Exception.Message -ForegroundColor Red}


Write-Host "'$RPT' has been copied." -ForegroundColor DarkCyan
}
else {

$Orgfilename = "$TargetCust\" + "$RPT"

#Change the value of the below variable to change the backup file name
$Newname = "$RPT" +'V22_Upgrade'+"$Date"

if((Get-ChildItem -Path "\\$Server\$TargetCust") -match $Newname){Write-Host "`nBackup of the report already exists with name '$Newname'" }
else{
Try{
Rename-Item -Path "\\$Server\$Orgfilename" -NewName $Newname -ErrorAction Stop}
Catch{Write-Host $_.Exception.Message -ForegroundColor Red}


Try {Copy-Item -path $fileonmachine -Destination "\\$Server\$TargetCust" -ErrorActio Stop}
catch{Write-Host $_.Exception.Message -ForegroundColor Red}

Write-Host "`n'$RPT' file found, taking a backup of the existing file..($Newname)" -ForegroundColor DarkCyan

Write-Host "'$RPT' has been copied." -ForegroundColor DarkCyan
}
}
}
else{Write-Host "\\$Server\$TargetCust Path not found"}
}
}
Read-Host -Prompt `n'Hit enter to exit'