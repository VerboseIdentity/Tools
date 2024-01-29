Clear-Host

$Servers = Get-Content -Path '..\Servers.txt'

Write-host "`nHi listing SSL certificate Thumprints..." 

ForEach($Server in $Servers){

$Thumbprint = Invoke-Command -ComputerName $Server -ScriptBlock{(Get-WebBinding -Name "Default Web Site" -Protocol 'https' -Port '443').CertificateHash}

echo "Connecting to $Server.."

Try{
$Hashtable += [ordered]@{"$Server" = "$Thumbprint"
}}
Catch{}

}
$Hashtable

Read-Host "`nHit Enter to Exit"
