@ECHO OFF
ECHO.
ECHO ===============================================================

ECHO.
ECHO Stopping windows service: World Wide Web Publishing Service
wmic service where (Name like 'W3SVC%%') call StopService
:WAIT_W3SVC
	timeout /t 2 > NUL
	for /f "tokens=4" %%s in ('sc query W3SVC ^| find "STATE"') do if NOT "%%s"=="STOPPED" goto WAIT_W3SVC

ECHO.
ECHO Stopping windows service: IIS Admin Service
wmic service where (Name like 'IISADMIN%%') call StopService
:WAIT_IISADMIN
	timeout /t 2 > NUL
	for /f "tokens=4" %%s in ('sc query IISADMIN ^| find "STATE"') do if NOT "%%s"=="STOPPED" goto WAIT_IISADMIN

ECHO.
ECHO Stopping windows service: SCRTBackgroundProcessing
wmic service where (Name like 'SCRTBackgroundProcessing%%') call StopService

ECHO.
ECHO Stopping windows service: MERTDistributionClient
wmic service where (Name like 'MERTDistributionClient%%') call StopService

ECHO.
ECHO Stopping windows service: AllscriptsNNClient
wmic service where (Name like 'AllscriptsNNClient%%') call StopService

ECHO.
ECHO Stopping windows service: SymedicalServerDistribution
wmic service where (Name like 'SymedicalServerDistribution%%') call StopService

ECHO.
ECHO Stopping windows service: SymedicalServerBackGroundProcessor
wmic service where (Name like 'SymedicalServerBackGroundProcessor%%') call StopService

ECHO.
ECHO Stopping windows service: Allscripts Community Gateway Adapter
wmic service where (Name like 'Allscripts Community Gateway Adapter%%') call StopService

ECHO.
ECHO Stopping windows service: EEHR Message Subscription
wmic service where (Name like 'EEHR_Subscriber_Service%%') call StopService

ECHO.
ECHO Stopping windows service: ADX Originator Host service
wmic service where (Name like 'ADX Originator Host Service%%') call StopService

ECHO.
ECHO Stopping windows service: EEHRProcessMonitor
wmic service where (Name like 'EEHRProcessMonitor%%') call StopService

ECHO.
ECHO Stopping windows service: TWPrintFaxQueueMonitor
wmic service where (Name like 'TWPrintFaxQueueMonitor%%') call StopService

ECHO.
ECHO Stopping windows service: TWFaxJobStatusUpdateService
wmic service where (Name like 'TWFaxJobStatusUpdateService%%') call StopService
:WAIT_TWFaxJobStatusUpdateService
	timeout /t 2 > NUL
	for /f "tokens=4" %%s in ('sc query TWFaxJobStatusUpdateService ^| find "STATE"') do if NOT "%%s"=="STOPPED" goto WAIT_TWFaxJobStatusUpdateService

ECHO.
ECHO Stopping windows service: TWMessageCenterSpooler
wmic service where (Name like 'TWMessageCenterSpooler%%') call StopService
:WAIT_TWMessageCenterSpooler
	timeout /t 2 > NUL
	for /f "tokens=4" %%s in ('sc query TWMessageCenterSpooler ^| find "STATE"') do if NOT "%%s"=="STOPPED" goto WAIT_TWMessageCenterSpooler

ECHO.
ECHO Stopping windows service: TWPptPlusEventHub
wmic service where (Name like 'TWPptPlusEventHub%%') call StopService
:WAIT_TWPptPlusEventHub
	timeout /t 2 > NUL
	for /f "tokens=4" %%s in ('sc query TWPptPlusEventHub ^| find "STATE"') do if NOT "%%s"=="STOPPED" goto WAIT_TWPptPlusEventHub

ECHO.
ECHO Stopping windows service: TWCSSSpooler
wmic service where (Name like 'TWCSSSpooler%%') call StopService

ECHO.
ECHO Stopping windows service: Medcin or Medcinserv
wmic service where (Name like 'Medcin%%') call StopService

ECHO.
ECHO Stopping windows service: MDRX Restoration
wmic service where (Name like 'MDRXRestoration%%') call StopService

ECHO.
ECHO Stopping windows service: Allscripts Logging Agent Service
wmic service where (Name like 'AllscriptsLoggingAgentService%%') call StopService

ECHO.
ECHO Stopping windows service: CHWTMSSWarning
wmic service where (Name like 'CHWTMSSWarning%%') call StopService

ECHO.
ECHO Stopping windows service: XtendDataService
wmic service where (Name like 'XtendDataService%%') call StopService
:WAIT_XtendDataService
	timeout /t 2 > NUL
	for /f "tokens=4" %%s in ('sc query XtendDataService ^| find "STATE"') do if NOT "%%s"=="STOPPED" goto WAIT_XtendDataService

ECHO.
ECHO Stopping windows service: DeltaService
wmic service where (Name like 'DeltaService%%') call StopService
:WAIT_DeltaService
	timeout /t 2 > NUL
	for /f "tokens=4" %%s in ('sc query DeltaService ^| find "STATE"') do if NOT "%%s"=="STOPPED" goto WAIT_DeltaService

ECHO.
ECHO Stopping windows service: AhsVoeService
wmic service where (Name like 'AhsVoeService%%') call StopService

ECHO.
ECHO Stopping windows service: Allscripts.IHE.GatewayAdapter
wmic service where (Name like 'Allscripts.IHE.GatewayAdapter%%') call StopService

ECHO.
ECHO Stopping windows service: AllscriptsUnityLogService
wmic service where (Name like 'AllscriptsUnityLogService%%') call StopService

ECHO.
ECHO Stopping windows service: IMPACT_IEX
wmic service where (Name like 'IMPACT_IEX%%') call StopService

ECHO.
ECHO Stopping windows service: IMPACT_TIFFER
wmic service where (Name like 'IMPACT_TIFFER%%') call StopService

ECHO.
ECHO ===============================================================

ECHO.
ECHO Set windows service startup type (Manual): World Wide Web Publishing Service
wmic service where (Name like 'W3SVC%%') call ChangeStartMode Manual

ECHO.
ECHO Set windows service startup type (Manual): IIS Admin Service
wmic service where (Name like 'IISADMIN%%') call ChangeStartMode Manual

ECHO.
ECHO Set windows service startup type (Manual): SCRTBackgroundProcessing
wmic service where (Name like 'SCRTBackgroundProcessing%%') call ChangeStartMode Manual

ECHO.
ECHO Set windows service startup type (Manual): MERTDistributionClient
wmic service where (Name like 'MERTDistributionClient%%') call ChangeStartMode Manual

ECHO.
ECHO Set windows service startup type (Manual): AllscriptsNNClient
wmic service where (Name like 'AllscriptsNNClient%%') call ChangeStartMode Manual

ECHO.
ECHO Set windows service startup type (Manual): SymedicalServerDistribution
wmic service where (Name like 'SymedicalServerDistribution%%') call ChangeStartMode Manual

ECHO.
ECHO Set windows service startup type (Manual): SymedicalServerBackGroundProcessor
wmic service where (Name like 'SymedicalServerBackGroundProcessor%%') call ChangeStartMode Manual

ECHO.
ECHO Set windows service startup type (Manual): Allscripts Community Gateway Adapter
wmic service where (Name like 'Allscripts Community Gateway Adapter%%') call ChangeStartMode Manual

ECHO.
ECHO Set windows service startup type (Manual): EEHR Message Subscription
wmic service where (Name like 'EEHR_Subscriber_Service%%') call ChangeStartMode Manual

ECHO.
ECHO Set windows service startup type (Manual): ADX Originator Host service
wmic service where (Name like 'ADX Originator Host Service%%') call ChangeStartMode Manual

ECHO.
ECHO Set windows service startup type (Manual): EEHRProcessMonitor
wmic service where (Name like 'EEHRProcessMonitor%%') call ChangeStartMode Manual

ECHO.
ECHO Set windows service startup type (Manual): TWPrintFaxQueueMonitor
wmic service where (Name like 'TWPrintFaxQueueMonitor%%') call ChangeStartMode Manual

ECHO.
ECHO Set windows service startup type (Manual): TWFaxJobStatusUpdateService
wmic service where (Name like 'TWFaxJobStatusUpdateService%%') call ChangeStartMode Manual

ECHO.
ECHO Set windows service startup type (Manual): TWMessageCenterSpooler
wmic service where (Name like 'TWMessageCenterSpooler%%') call ChangeStartMode Manual

ECHO.
ECHO Set windows service startup type (Manual): TWPptPlusEventHub
wmic service where (Name like 'TWPptPlusEventHub%%') call ChangeStartMode Manual

ECHO.
ECHO Set windows service startup type (Manual): TWCSSSpooler
wmic service where (Name like 'TWCSSSpooler%%') call ChangeStartMode Manual

ECHO.
ECHO Set windows service startup type (Manual): Medcin or Medcinserv
wmic service where (Name like 'Medcin%%') call ChangeStartMode Manual

ECHO.
ECHO Set windows service startup type (Manual): MDRX Restoration
wmic service where (Name like 'MDRXRestoration%%') call ChangeStartMode Manual

ECHO.
ECHO Set windows service startup type (Manual): Allscripts Logging Agent Service 
wmic service where (Name like 'AllscriptsLoggingAgentService%%') call ChangeStartMode Manual

ECHO.
ECHO Set windows service startup type (Manual): CHWTMSSWarning
wmic service where (Name like 'CHWTMSSWarning%%') call ChangeStartMode Manual

ECHO.
ECHO Set windows service startup type (Manual): XtendDataService
wmic service where (Name like 'XtendDataService%%') call ChangeStartMode Manual

ECHO.
ECHO Set windows service startup type (Manual): DeltaService
wmic service where (Name like 'DeltaService%%') call ChangeStartMode Manual

ECHO.
ECHO Set windows service startup type (Disabled): AhsVoeService
wmic service where (Name like 'AhsVoeService%%') call ChangeStartMode Disabled

ECHO.
ECHO Set windows service startup type (Manual): Allscripts.IHE.GatewayAdapter
wmic service where (Name like 'Allscripts.IHE.GatewayAdapter%%') call ChangeStartMode Manual

ECHO.
ECHO Set windows service startup type (Manual): AllscriptsUnityLogService
wmic service where (Name like 'AllscriptsUnityLogService%%') call ChangeStartMode Manual

ECHO.
ECHO Set windows service startup type (Manual): IMPACT_IEX
wmic service where (Name like 'IMPACT_IEX%%') call ChangeStartMode Manual

ECHO.
ECHO Set windows service startup type (Manual): IMPACT_TIFFER
wmic service where (Name like 'IMPACT_TIFFER%%') call ChangeStartMode Manual

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