cls

Read-Host -Prompt "`nPlease mention the servers list in 'Servers.txt' folder in same directory. If already mentioned hit enter to continue"

echo "`nIntitalizing master script...`n"

echo "listing individual scripts for quick execution .."

While($true){
cls

Write-Host "`n1. Admin users check"
Write-Host "2. Add domain accounts to the admin group"
Write-Host "3. Import .FPX Certificates"
Write-Host "4. Import .CER certificates"
Write-Host "5. Certificate deletion"
Write-Host "6. Common config comparision"
Write-Host "7. Copy Script"
Write-Host "8. Customizations Check"
Write-Host "9. Replace customizations"
Write-Host "10. Delta,Clinevolve, ATP and Unity Server Identity"
Write-Host "11. Space check in 'C' Drive"
Write-Host "12. Google Chrome version check"
Write-Host "13. IIS Reset"
Write-Host "14. IIS update script"
Write-Host "15. Installed software version check"
Write-Host "16. OS Version Check"
Write-Host "17. Get OSA cert Thumbprint"
Write-Host "18. Get STS cert Thumbprint"
Write-Host "19. Get AUP cert Thumbprint"
Write-Host "20. Get Processor cores count"
Write-Host "21. Get RAM size"
Write-Host "22. Shield Config file comparision"
Write-Host "23. Get SSL binding with thumprint"

$Result = Read-Host "`nEnter the number"

Switch ($Result){

    1 {
    
    Echo "Please specify the domain accounts in 'C:\AHSINSTALL\TW\My Tools\Admin Group Script\User account.txt file'"
    $AdminuserCheck = "C:\AHSINSTALL\TW\My Tools\Admin Group Script\Admin Group check.ps1"
    ."$AdminuserCheck"
    
    }

    2 {
    
    Echo "Please specify the domain accounts in 'C:\AHSINSTALL\TW\My Tools\Admin Group Script\Users to add.txt file'"
    $AdminuserCheck = "C:\AHSINSTALL\TW\My Tools\Admin Group Script\Add Domain accounts.ps1"
    ."$AddDomainact"
    
    }

    3 {
    
    Echo "Calling PFX Certificate import script.."
    Write-Host "Place .PFX certificates in the following file : C:\AHSINSTALL\TW\My Tools\Cert import\PFX Certs" -ForegroundColor Yellow
    $PFX = "C:\AHSINSTALL\TW\My Tools\Cert import\PFXcert import.ps1"
    ."$PFX"
    
    }
    
    4 {
    
    Echo "Calling CER Certificate import script.."
    Write-Host "Place .CER certificates in the following file : C:\AHSINSTALL\TW\My Tools\Cert import\CER Certs" -ForegroundColor Yellow
    $CER = "C:\AHSINSTALL\TW\My Tools\Cert import\CER Cert Import.ps1"
    ."$CER"
    
    }

    5 {
    
    Echo "Calling Certificate deletion script.."
    $Certdel = "C:\AHSINSTALL\TW\My Tools\Certificate deletion\Certificate Deletion.ps1"
    ."$Certdel"
    
    }

    6 {
    
    Echo "Initiating Common config comparision file.."
    $CommonConfig = "C:\AHSINSTALL\TW\My Tools\Common Config comparison\Common Config comparison.ps1"
    ."$CommonConfig"
    
    }

    7 {
    
    Echo "Calling Copy script.."
    $Copy = "C:\AHSINSTALL\TW\My Tools\Copy Script\Copy Script.ps1"
    ."$Copy"
    
    }

    8 {
    
    Echo "Calling customizations check script..."
    $customizations = "C:\AHSINSTALL\TW\My Tools\Customizations\Customizations check.ps1"
    Write-Host "Place the customizations files(.rpt) in the following location : C:\AHSINSTALL\TW\My Tools\Customizations\RPT Files" -ForegroundColor Yellow
    ."$customizations"
    
    }

    9 {
    
    Echo "Calling Replace customizations script..."
    $repcus = "C:\AHSINSTALL\TW\My Tools\Customizations\Copy customizations.ps1"
    Write-Host "Place the customizations files(.rpt) in the following location : C:\AHSINSTALL\TW\My Tools\Customizations\RPT Files" -ForegroundColor Yellow
    ."$repcus"
    
    }

    10 {
    
    Echo "Calling Delta,Clinevolve, ATP and Unity Server Identity script..."
    $Identity = "C:\AHSINSTALL\TW\My Tools\Delta,Clinevolve, ATP and Unity Server Identity\Delta, Clinevolve, ATP and unity Server.ps1"
    ."$Identity"
    
    }

    11 {
    
    Echo "Calling Drive space check..."
    $Space = "C:\AHSINSTALL\TW\My Tools\Disk Space check\Disk check.ps1"
    ."$Space"
    
    }

    12 {
    
    Echo "Calling drive Space check"
    $GoogleVer = "C:\AHSINSTALL\TW\My Tools\Google Chrome Version Check\Chrome Version.ps1"
    ."$GoogleVer"
    
    }

    13 {
    
    Echo "Initiating IIS reset script..."
    $IISreset = "C:\AHSINSTALL\TW\My Tools\IIS Reset\IIS Reset Script.ps1"
    ."$IISreset"
    
    }

    14 {
    
    Echo "Initiating IIS Port 80 update script..."
    $IISupdate = "C:\AHSINSTALL\TW\My Tools\IIS update script\IIS port 80 update.ps1"
    ."$IISupdate"
    
    }

    15 {
    
    Echo "Calling Installed software version check script..."
    $Software = "C:\AHSINSTALL\TW\My Tools\Installed Software check\Installed software check.ps1"
    ."$Software"
    
    }

    16 {
    
    Echo "Calling Operating system version script..."
    $OS = "C:\AHSINSTALL\TW\My Tools\OS Version Check\OS Version Check.ps1"
    ."$OS"
    
    }

    17 {
    
    Echo "Calling OSA Certificate script..."
    $OSA = "C:\AHSINSTALL\TW\My Tools\OSA STS and AUP Script\OSA Script.ps1"
    ."$OSA"
    
    }

    18 {
    
    Echo "Calling STS Certificate script..."
    $STS = "C:\AHSINSTALL\TW\My Tools\OSA STS and AUP Script\STS Script.ps1"
    ."$STS"
    
    }

    19 {
    
    Echo "Calling AUP Certificate script..."
    $PRO = "C:\AHSINSTALL\TW\My Tools\OSA STS and AUP Script\AUP Script.ps1"
    ."$PRO"
    
    }



    20 {
    
    Echo "Calling Processors count script..."
    $PRO = "C:\AHSINSTALL\TW\My Tools\Processor\Processors.ps1"
    ."$PRO"
    
    }

     21 {
    
    Echo "Calling RAM size script..."
    $RAM = "C:\AHSINSTALL\TW\My Tools\RAM Check\Ram Size Check.ps1"
    ."$RAM"
    
    }

     22 {
    
    Echo "Calling Shield configuration comparision script..."
    $SConfig = "C:\AHSINSTALL\TW\My Tools\Shield Config file comparision\Shield Config file comparision.ps1"
    ."$SConfig"
    
    }

    23 {
    
    Echo "Calling SSL binding script..."
    $SSL = "C:\AHSINSTALL\TW\My Tools\SSL Script\SSL Script.ps1"
    ."$SSL"
    
    }

    Default{Write-host "Invalid input" -ForegroundColor Red}

 }
 }