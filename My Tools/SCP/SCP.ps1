cls

Write-Host "`nPreparing for SCP configurations...." -ForegroundColor Yellow

$Servers = Get-Content -Path "C:\AHSINSTALL\TW\My Tools\Servers.txt"
Clear-Content -Path "C:\AHSINSTALL\TW\My Tools\SCP\Output.csv" -ErrorAction SilentlyContinue

$Heading = "ServerName`t OS_Name`t RAM`t Processors`t IPAddress`t Free_Space_on_drive_C (GB)`t Total_space_on_drive_C (GB)"
$Heading | Out-File -FilePath "C:\AHSINSTALL\TW\My Tools\SCP\Output.csv" -Append
foreach($Server in $Servers){

$Master = Invoke-command -ComputerName $Server -ScriptBlock{(Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion").ProductName}

$RAMbytes = Invoke-Command -ComputerName $Server -ScriptBlock { (Get-WmiObject -class "cim_physicalmemory" | Measure-Object -Property Capacity -Sum).Sum}
$gb = $RAMbytes / 1024 / 1024 / 1024

$Proc = Invoke-Command -ComputerName $Server -ScriptBlock {(Get-ItemProperty "HKLM:\System\CurrentControlSet\Control\Session Manager\Environment").NUMBER_OF_PROCESSORS}
$IPAddress = Invoke-Command -ComputerName $Server -ScriptBlock{ (Get-NetIPAddress -AddressFamily IPv4).IPAddress} | Select-String -NotMatch -Pattern '127.0.0.1'

####################################################################

$Drive_Space = Invoke-Command -ComputerName $Server -ScriptBlock { Get-Volume C}
If (($Drive_Space).SizeRemaining/1gb -ge (($Drive_Space).Size/1gb*0.2)){
$free_space_whole = (($Drive_Space).SizeRemaining/1gb)
$free_space = "{0:N2}" -f $free_space_whole

$total_space_whole = (($Drive_Space).Size/1gb)
$total_space = "{0:N2}" -f $total_space_whole


}else{

$free_space_whole = (($Drive_Space).SizeRemaining/1gb)
$free_space = "{0:N2}" -f $free_space_whole

$total_space_whole = (($Drive_Space).Size/1gb)
$total_space = "{0:N2}" -f $total_space_whole

}


$Base_OutPut = Write-Output "$Server`t $Master`t $gb`t $Proc`t $IPAddress`t $free_space`t $total_space" | Out-File -FilePath "C:\AHSINSTALL\TW\My Tools\SCP\Output.csv" -Append

[PSCustomObject]@{

Server = "$Server          "
OS_Version = "$Master "
RAM = "$gb"
Processors = "$Proc"
}

}
#$Hashtable | Out-File -FilePath "C:\AHSINSTALL\TW\My Tools\SCP\Output.txt"
Read-Host -Prompt "`nHit Enter to exit"




