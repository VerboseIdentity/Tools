Clear-Host 

$Servers = Get-Content "..\Servers.txt"

foreach ($Main in $Servers){

Invoke-Command -ComputerName $Main -ScriptBlock {

$Old_Bindings = Get-WebBinding -Name "Default Web Site" -Protocol "http" -Port "80"

$bindingInformation = Get-WebBinding -Name "Default Web Site" -Protocol "http" -Port "80" | Select-Object -Property "bindingInformation"

}

$Count = $Old_Bindings.Count


If($Count -ge 2 -or $Count -eq 0 ){

Invoke-Command -ComputerName $Main -ScriptBlock {

Write-Host "`nUpdating Port 80 bining on", $Main

Write-Host "`nPerforming an IIS Reset" -ForegroundColor Yellow

Remove-WebBinding -Name "Default Web Site" -Protocol "http" -Port "80" -ErrorAction SilentlyContinue

New-WebBinding -Name "Default Web Site" -Protocol "http" -Port "80" -IPAddress "*"

iisreset.exe }

Write-Host "`nPort Updated !! " -ForegroundColor Green 

}

elseif ($Count -eq 1)
{

Invoke-Command -ComputerName $Main -ScriptBlock {

$Old_Bindings = Get-WebBinding -Name "Default Web Site" -Protocol "http" -Port "80"

$bindingInformation = Get-WebBinding -Name "Default Web Site" -Protocol "http" -Port "80" | Select-Object -Property "bindingInformation"


Write-Host "Checking IPAddress to port 80 on $Main" -ForegroundColor Yellow

Set-WebBinding -Name "Default Web Site" -BindingInformation '[::1]:80:' -PropertyName "bindingInformation" -Value "*:80:" 

Set-WebBinding -Name "Default Web Site" -BindingInformation ($env:IP_INTERNAL + ':80:') -PropertyName "bindingInformation" -Value "*:80:" 

iisreset.exe
 
Write-Host "`nPort Updated on $Main" -ForegroundColor Green}

}

else{

Write-Host "All Set"

}
}

Read-Host -Prompt "`nHit Enter to Exit"
