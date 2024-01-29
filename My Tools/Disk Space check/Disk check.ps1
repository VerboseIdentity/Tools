cls

function Drive_Space{

Write-Host "`nListing Disk Spaces..." -ForegroundColor Yellow

$Servers = Get-content -Path "..\Servers.txt"

foreach($Server in $Servers){

Write-Output "`nChecking disk space on [$Server]`n************************"

$Disk_info = Invoke-Command -ComputerName $Server -ScriptBlock {
(Get-Volume C)
}

If (($Disk_info).SizeRemaining/1gb -ge 20 ) {
$free_space_whole = (($Disk_info).SizeRemaining/1gb)
$free_space = "{0:N2}" -f $free_space_whole

$total_space_whole = (($Disk_info).Size/1gb)
$total_space = "{0:N2}" -f $total_space_whole

Write-Host "Free space on C drive:" -ForegroundColor Green $free_space GB
Write-Host "Total space on C drive:" $total_space GB

}else{

$free_space_whole = ($Disk_info.SizeRemaining/1gb)
$free_space = "{0:N2}" -f $free_space_whole

$total_space_whole = ($Disk_info.Size/1gb)
$total_space = "{0:N2}" -f $total_space_whole

Write-Host "Free space on C drive:" -ForegroundColor Red $free_space GB
Write-Host "Total space on C drive:" $total_space GB

}
}
}

Drive_space

Read-Host -Prompt "`nHit Enter to exit"
