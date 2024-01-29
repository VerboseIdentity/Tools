Cls
Write-Host "`nLets check the Google Chrome version..`n" -ForegroundColor Yellow

$Servers = Get-Content -Path "..\Servers.txt"
Clear-Content -Path ".\Google_Chrome_Output.txt" -ErrorAction SilentlyContinue
foreach($Server in $Servers){

$Version = Invoke-Command -ComputerName $Server -ScriptBlock { $(Get-Package -Name "Google Chrome").Version}

echo "Connecting to $Server"

Try{
$Hashtable += [ordered]@{ "$Server" = "$Version"}}
Catch{}

}
$Hashtable
$Hashtable | Out-File -FilePath ".\Google_Chrome_Output.txt"
Read-Host -Prompt "`nHit enter to Exit"