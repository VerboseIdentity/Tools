Clear-Host

Write-Host "`nLets check processor cores...`n"

$Servers = Get-Content -Path "..\Servers.txt"
Clear-Content -Path ".\Processors_output.txt" -ErrorAction SilentlyContinue
foreach($Server in $Servers){
$Proc = Invoke-Command -ComputerName $Server -ScriptBlock {(Get-ItemProperty "HKLM:\System\CurrentControlSet\Control\Session Manager\Environment").NUMBER_OF_PROCESSORS}

echo "fetching information from $Server"

Try{
$Hashtable += [ordered]@{"$Server" = "$Proc"
}}
Catch{}
}
$Hashtable
$Hashtable | Out-File -FilePath ".\Processors_output.txt"
Read-Host -Prompt "`nHit enter to exit"