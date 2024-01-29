cls

Write-Host "`nListing Operating systems...... `n" -ForegroundColor Yellow

$Servers = Get-Content -Path "..\Servers.txt"
Clear-Content -Path ".\OS_Output.txt" -ErrorAction SilentlyContinue
foreach($Server in $Servers){

$Master = Invoke-command -ComputerName $Server -ScriptBlock{(Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion").ProductName}

echo "Fetching information from $Server"

Try{
$Hashtable += [ordered]@{"$Server" = $Master
}}
Catch{}
}

$Hashtable
$Hashtable | Out-File -FilePath ".\OS_Output.txt"
Read-Host -Prompt "`nHit Enter to exit"