@ECHO OFF
ECHO.
ECHO ===============================================================

ECHO.
ECHO Set windows service startup type (Automatic): World Wide Web Publishing Service
wmic service where (Name like 'W3SVC%%') call ChangeStartMode Automatic

ECHO.
ECHO Set windows service startup type (Automatic): IIS Admin Service
wmic service where (Name like 'IISADMIN%%') call ChangeStartMode Automatic

ECHO.
ECHO Set windows service startup type (Automatic): DeltaService
wmic service where (Name like 'DeltaService%%') call ChangeStartMode Automatic

ECHO.
ECHO Set windows service startup type (Automatic): XtendDataService
wmic service where (Name like 'XtendDataService%%') call ChangeStartMode Automatic

ECHO.
ECHO Set windows service startup type (Automatic): MDRX Restoration
wmic service where (Name like 'MDRXRestoration%%') call ChangeStartMode Automatic

ECHO.
ECHO Set windows service startup type (Automatic): Allscripts Logging Agent Service
wmic service where (Name like 'AllscriptsLoggingAgentService%%') call ChangeStartMode Automatic

ECHO.
ECHO Set windows service startup type (Automatic): TWPptPlusEventHub
REM wmic service where (Name like 'TWPptPlusEventHub%%') call ChangeStartMode Automatic
sc config "TWPptPlusEventHub" start= delayed-auto

ECHO.
ECHO Set windows service startup type (Automatic): TWMessageCenterSpooler
REM wmic service where (Name like 'TWMessageCenterSpooler%%') call ChangeStartMode Automatic
sc config "TWMessageCenterSpooler" start= delayed-auto

ECHO.
ECHO Set windows service startup type (Automatic): TWFaxJobStatusUpdateService
REM wmic service where (Name like 'TWFaxJobStatusUpdateService%%') call ChangeStartMode Automatic
sc config "TWFaxJobStatusUpdateService" start= delayed-auto

ECHO.
ECHO Set windows service startup type (Automatic): TWPrintFaxQueueMonitor
wmic service where (Name like 'TWPrintFaxQueueMonitor%%') call ChangeStartMode Automatic

ECHO.
ECHO Set windows service startup type (Automatic): EEHRProcessMonitor
wmic service where (Name like 'EEHRProcessMonitor%%') call ChangeStartMode Automatic

ECHO.
ECHO Set windows service startup type (Automatic): Allscripts Community Gateway Adapter
wmic service where (Name like 'Allscripts Community Gateway Adapter%%') call ChangeStartMode Automatic

ECHO.
ECHO Set windows service startup type (Automatic): SymedicalServerBackGroundProcessor
wmic service where (Name like 'SymedicalServerBackGroundProcessor%%') call ChangeStartMode Automatic

ECHO.
ECHO Set windows service startup type (Automatic): SymedicalServerDistribution
wmic service where (Name like 'SymedicalServerDistribution%%') call ChangeStartMode Automatic

ECHO.
ECHO Set windows service startup type (Automatic): AllscriptsNNClient
wmic service where (Name like 'AllscriptsNNClient%%') call ChangeStartMode Automatic

ECHO.
ECHO Set windows service startup type (Automatic): MERTDistributionClient
wmic service where (Name like 'MERTDistributionClient%%') call ChangeStartMode Automatic

ECHO.
ECHO Set windows service startup type (Automatic): SCRTBackgroundProcessing
wmic service where (Name like 'SCRTBackgroundProcessing%%') call ChangeStartMode Automatic

ECHO.
ECHO Set windows service startup type (Automatic): Allscripts.IHE.GatewayAdapter
wmic service where (Name like 'Allscripts.IHE.GatewayAdapter%%') call ChangeStartMode Automatic

ECHO.
ECHO Set windows service startup type (Automatic): AllscriptsUnityLogService
wmic service where (Name like 'AllscriptsUnityLogService%%') call ChangeStartMode Automatic

ECHO.
ECHO Set windows service startup type (Automatic): IMPACT_IEX
wmic service where (Name like 'IMPACT_IEX%%') call ChangeStartMode Automatic

ECHO.
ECHO Set windows service startup type (Automatic): IMPACT_TIFFER
wmic service where (Name like 'IMPACT_TIFFER%%') call ChangeStartMode Automatic

ECHO.
ECHO ===============================================================

ECHO.
ECHO Starting windows service: World Wide Web Publishing Service
wmic service where (Name like 'W3SVC%%') call StartService
:WAIT_W3SVC
	timeout /t 2 > NUL
	for /f "tokens=4" %%s in ('sc query W3SVC ^| find "STATE"') do if NOT "%%s"=="RUNNING" goto WAIT_W3SVC

ECHO.
ECHO Starting windows service: IIS Admin Service
wmic service where (Name like 'IISADMIN%%') call StartService
:WAIT_IISADMIN
	timeout /t 2 > NUL
	for /f "tokens=4" %%s in ('sc query IISADMIN ^| find "STATE"') do if NOT "%%s"=="RUNNING" goto WAIT_IISADMIN

ECHO.
ECHO Starting windows service: DeltaService
wmic service where (Name like 'DeltaService%%') call StartService
:WAIT_DeltaService
	timeout /t 2 > NUL
	for /f "tokens=4" %%s in ('sc query DeltaService ^| find "STATE"') do if NOT "%%s"=="RUNNING" goto WAIT_DeltaService

ECHO.
ECHO Starting windows service: XtendDataService
wmic service where (Name like 'XtendDataService%%') call StartService
:WAIT_XtendDataService
	timeout /t 2 > NUL
	for /f "tokens=4" %%s in ('sc query XtendDataService ^| find "STATE"') do if NOT "%%s"=="RUNNING" goto WAIT_XtendDataService

ECHO.
ECHO Starting windows service: MDRX Restoration
wmic service where (Name like 'MDRXRestoration%%') call StartService

ECHO.
ECHO Starting windows service: Allscripts Logging Agent Service
wmic service where (Name like 'AllscriptsLoggingAgentService%%') call StartService

ECHO.
ECHO Starting windows service: TWPptPlusEventHub
wmic service where (Name like 'TWPptPlusEventHub%%') call StartService
:WAIT_TWPptPlusEventHub
	timeout /t 2 > NUL
	for /f "tokens=4" %%s in ('sc query TWPptPlusEventHub ^| find "STATE"') do if NOT "%%s"=="RUNNING" goto WAIT_TWPptPlusEventHub

ECHO.
ECHO Starting windows service: TWMessageCenterSpooler
wmic service where (Name like 'TWMessageCenterSpooler%%') call StartService
:WAIT_TWMessageCenterSpooler
	timeout /t 2 > NUL
	for /f "tokens=4" %%s in ('sc query TWMessageCenterSpooler ^| find "STATE"') do if NOT "%%s"=="RUNNING" goto WAIT_TWMessageCenterSpooler

ECHO.
ECHO Starting windows service: TWFaxJobStatusUpdateService
wmic service where (Name like 'TWFaxJobStatusUpdateService%%') call StartService
:WAIT_TWFaxJobStatusUpdateService
	timeout /t 2 > NUL
	for /f "tokens=4" %%s in ('sc query TWFaxJobStatusUpdateService ^| find "STATE"') do if NOT "%%s"=="RUNNING" goto WAIT_TWFaxJobStatusUpdateService

ECHO.
ECHO Starting windows service: TWPrintFaxQueueMonitor
wmic service where (Name like 'TWPrintFaxQueueMonitor%%') call StartService

ECHO.
ECHO Starting windows service: EEHRProcessMonitor
wmic service where (Name like 'EEHRProcessMonitor%%') call StartService

ECHO.
ECHO Starting windows service: Allscripts Community Gateway Adapter
wmic service where (Name like 'Allscripts Community Gateway Adapter%%') call StartService

ECHO.
ECHO Starting windows service: SymedicalServerBackGroundProcessor
wmic service where (Name like 'SymedicalServerBackGroundProcessor%%') call StartService

ECHO.
ECHO Starting windows service: SymedicalServerDistribution
wmic service where (Name like 'SymedicalServerDistribution%%') call StartService

ECHO.
ECHO Starting windows service: AllscriptsNNClient
wmic service where (Name like 'AllscriptsNNClient%%') call StartService

ECHO.
ECHO Starting windows service: MERTDistributionClient
wmic service where (Name like 'MERTDistributionClient%%') call StartService

ECHO.
ECHO Starting windows service: SCRTBackgroundProcessing
wmic service where (Name like 'SCRTBackgroundProcessing%%') call StartService

ECHO.
ECHO Starting windows service: Allscripts.IHE.GatewayAdapter
wmic service where (Name like 'Allscripts.IHE.GatewayAdapter%%') call StartService

ECHO.
ECHO Starting windows service: AllscriptsUnityLogService
wmic service where (Name like 'AllscriptsUnityLogService%%') call StartService

ECHO.
ECHO Starting windows service: IMPACT_IEX
wmic service where (Name like 'IMPACT_IEX%%') call StartService

ECHO.
ECHO Starting windows service: IMPACT_TIFFER
wmic service where (Name like 'IMPACT_TIFFER%%') call StartService


ECHO.
ECHO ===============================================================

ECHO.
ECHO Analyzing and Configuring Windows Remote Management (WinRM) service
wmic process call create 'powershell.exe -WindowStyle "Hidden" -Command "WinRM QuickConfig -Quiet -Force"'

ECHO.
ECHO Configure the local computer for remote management
wmic process call create 'powershell.exe -WindowStyle "Hidden" -Command "Set-WSManQuickConfig -Force"'

ECHO.
ECHO Configuring the computer to receive remote commands
wmic process call create 'powershell.exe -WindowStyle "Hidden" -Command "Enable-PSRemoting -Force"'
REM Impose a delay of 15 seconds to complete the above command
ping -n 15 127.0.0.1 > nul

REM ECHO.
REM ECHO End or kill Windows PowerShell process(s) if found running
REM wmic process where (Name like 'powershell%%') Delete

ECHO.
ECHO ===============================================================
ECHO.