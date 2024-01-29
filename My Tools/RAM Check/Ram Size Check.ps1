Clear-Host

$Servers = Get-Content -Path ../Servers.txt

Write-Host "`nChecking RAM size ....`n"
$Volume = "GB"

Clear-Content -Path .\RAM_output.txt -ErrorAction SilentlyContinue

Foreach($Server in $Servers){
$bytes = Invoke-Command -ComputerName $Server -ScriptBlock { (Get-WmiObject -class "cim_physicalmemory" | Measure-Object -Property Capacity -Sum).Sum}
$gb = $bytes / 1024 / 1024 / 1024

echo "Fetching info from $Server"
Try{
$Table += [ordered]@{"$Server" = "$gb"}}
catch{}
}
$Table
$Table | Out-File -FilePath .\RAM_output.txt

Read-Host -Prompt "`nHit Enter to Exit"
