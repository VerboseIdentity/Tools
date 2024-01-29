Clear-Host

Write-Host "`nInspecting default printers"

$Servers = Get-Content -Path "..\Servers.txt"

$creds = Get-Credential -Message "Account on which spooler runs: " -UserName "SpoolerAccount"

foreach($Server in $Servers){

$Defprt = Invoke-Command -ComputerName $Server -Credential $creds -ScriptBlock {(Get-ItemProperty "HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Windows").Device}
$space = " "*10
[PSCustomObject] @{Server = $Server + $space ; Printer = $Defprt.Split(",")[0] + $space * 2}
Start-Sleep -Seconds 1
}
Read-Host "`nHit enter to exit"