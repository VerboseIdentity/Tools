
Function Normal_copy{

Clear-Host

$Source = Read-Host "`nHi There, please specify the location of the file you want to copy "

$FolderName = Read-Host "`nPlease mention the name of the folder with extention "

$Servers =  Get-Content "..\Servers.txt"

Write-Host "`nPlease Specify the location on the servers where the file should be copied" -ForegroundColor Yellow

$Destination = Read-Host "`nMake Certain to mention '$' after specifying the drive '(EX: C$\AHSINSTALL\TW.....etc)'"


Foreach ($Server in $Servers)
{

Write-Host "`nCopying $Source to $Destination"

$Destfoldercontents = Get-ChildItem -Name "\\$Server\$Destination" -ErrorAction SilentlyContinue

if($Destfoldercontents -eq $null){
$lastfoldername = $Destination | Split-Path -Leaf
$NewPath = $Destination | Split-Path -Parent

$Execution = New-Item -Path \\$Server\$NewPath -ItemType Directory -Name $lastfoldername}

If ($Destfoldercontents -like $FolderName)

{

Write-host "`n$FolderName already exist on $Server" -ForegroundColor Red -Verbose

}
Else 
{

Copy-Item $Source\$FolderName -Destination "\\$Server\$Destination" -Recurse

Write-Host "`nCopy has been completed on $Server......!!" -ForegroundColor Green 

}
}
Write-Host ""
Read-Host -prompt "Hit Enter to Exit"

}

##############################################################################################


Function Force_copy{

Clear-Host

$Source = Read-Host "`nHi There, please specify the location of the file you want to copy "

$FolderName = Read-Host "`nPlease mention the name of the folder with extention "

$Servers =  Get-Content "..s\Servers.txt"

Write-Host "`nPlease Specify the location on the servers where the file should be copied" -ForegroundColor Yellow

$Destination = Read-Host "`nMake Certain to mention '$' after specifying the drive '(EX: C$\AHSINSTALL\TW.....etc)'"


Foreach ($Server in $Servers)
{

Write-Host "`nCopying $Source to $Destination"

Start-Sleep -Seconds 1

$Destfoldercontents = Get-ChildItem -Name "\\$Server\$Destination" -ErrorAction SilentlyContinue

if (Test-Path "\\$Server\$Destination"){

Copy-Item $Source\$FolderName -Destination "\\$Server\$Destination" -Recurse -Force

Write-Host "`nCopy has been completed on $Server......!!" -ForegroundColor Green 

}
else{
New-Item -Path "\\$Server\$Destination" -ItemType Directory

Copy-Item $Source\$FolderName -Destination "\\$Server\$Destination" -Recurse -Force

Write-Host "`nCopy has been completed on $Server......!!" -ForegroundColor Green 

}

}
Write-Host ""
Read-Host -prompt "Hit Enter to Exit"
}


Write-Host "`nHi welcome to copy script...."
Start-Sleep -Seconds 1
$input = Read-Host "`n1.Normal_Copy`n2.Force_copy`n`nEnter the input "

if ($input -eq 1){
    Normal_copy
    }
elseif($input -eq 2){
    Force_copy
    }
