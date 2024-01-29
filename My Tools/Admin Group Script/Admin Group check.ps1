Clear-Host

Write-Output `n"Checking Admin group...."

$Servers = Get-Content "..\Servers.txt"

$Accounts = Get-Content -Path ".\User Accounts.txt"

Foreach($Server in $Servers){

Write-Host "`nWorking on $Server" -ForegroundColor Yellow

$Admins = Invoke-command -computerName $Server -Scriptblock {

net localgroup administrators}
 

#$Jaffa = Get-Content -Path "C:\AHSINSTALL\TW\My Tools\Admin Group Script\Secret.txt"


#$Org = $Compaccnt.Trim()


foreach($_account in $Accounts){


if($Admins -contains $_account){

Write-Host "$_account is in the admin group." -ForegroundColor Green
}

else
{
Write-Host "$_account is not in admin group." -ForegroundColor Red
}
}
}
echo ""
Powershell -noexit


#Get-LocalGroupMember -Name Administrators | Select-Object Name

#If((Get-LocalGroupMember -Group Administrators | Select-Object Name) -like '*SERVICES\twWebAppUser*'){Write-Host "Available"} else{Write-Host "Not Available"}