Cls

$Con = Read-Host "`nHi There !! DO you want to get the list of all installed softwares (T/F)?"
$Servers = Get-Content -Path "..\Servers.txt"
Clear-Content -Path ".\Result.txt"
If($Con -eq 'T')
{
ForEach($Server in $Servers){
Write-Host "`n************************************** $Server ********************************************"
Write-Output "`n************************************** $Server ********************************************" | Out-File ".\Result.txt" -Append
$Data = Invoke-Command -ComputerName $Server -ScriptBlock{ Get-ItemProperty 'HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*' | Select-Object DisplayName, Publisher,DisplayVersion | Sort-Object DisplayName | Format-Table DisplayName, Publisher,DisplayVersion}
$Data | Out-File ".\Result.txt" -Append #| Format-Wide -AutoSize
$Data
Write-Host "Output is exported to a Txt file in the same folder" -ForegroundColor DarkCyan
}
}
elseif($Con -eq 'F'){
Foreach($Server in $Servers){
Write-Host "`n************************************** $Server ********************************************"
Write-Output "`n************************************** $Server ********************************************" | Out-File ".\Result.txt" -Append
$Data = Invoke-Command -ComputerName $Server -ScriptBlock{ Get-ItemProperty 'HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*' | Select-Object DisplayName, Publisher,DisplayVersion | Where {$_.Publisher -like '*Allscripts*' -or $_.Publisher -like '*Clinical*' -or $_.Publisher -like '*Altera*' -or $_.Publisher -like '*Black Ice Software*' -or $_.Publisher -like '*Midmark*'} | Sort-Object DisplayName | Format-Table DisplayName, Publisher,DisplayVersion}
$Data | Out-File ".\Result.txt" -Append #| Format-Wide -AutoSize
$Data
Write-Host "Output is exported to a Txt file in the same folder" -ForegroundColor DarkCyan
}
}
else{Write-Host "`nPlease enter Correct value" -ForegroundColor Red}

powershell -noexit
