::  Windows Aktivasyon Arac�
::  Written by @BoomBookTR
::  https://github.com/BoomBookTR/Windows-Legal-Activation-Script
::  Lisans Anahtar� Telegram Kanal�m�z: https://t.me/windows_office_etkinlestir


@echo off
setlocal EnableDelayedExpansion

::net file to test privileges, 1>NUL redirects output, 2>NUL redirects errors
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto START ) else ( goto getPrivileges ) 

:getPrivileges
if '%1'=='ELEV' ( goto START )

set "batchPath=%~f0"
set "batchArgs=ELEV"

::Add quotes to the batch path, if needed
set "script=%0"
set script=%script:"=%
IF '%0'=='!script!' ( GOTO PathQuotesDone )
    set "batchPath=""%batchPath%"""
:PathQuotesDone

::Add quotes to the arguments, if needed.
:ArgLoop
IF '%1'=='' ( GOTO EndArgLoop ) else ( GOTO AddArg )
    :AddArg
    set "arg=%1"
    set arg=%arg:"=%
    IF '%1'=='!arg!' ( GOTO NoQuotes )
        set "batchArgs=%batchArgs% "%1""
        GOTO QuotesDone
        :NoQuotes
        set "batchArgs=%batchArgs% %1"
    :QuotesDone
    shift
    GOTO ArgLoop
:EndArgLoop

::Create and run the vb script to elevate the batch file
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs"
echo UAC.ShellExecute "cmd", "/c ""!batchPath! !batchArgs!""", "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs"
"%temp%\OEgetPrivileges.vbs" 
exit /B

:START
::Remove the elevation tag and set the correct working directory
IF '%1'=='ELEV' ( shift /1 )
cd /d %~dp0

:: .... your code start ....


@echo off
setlocal EnableDelayedExpansion

::curl -L "https://getconfirmationid.com/ajax/cidms_api?iids=%IID%&username=trogiup24h&password=PHO" > CID_windows.txt


rem Komut ��kt�s�n� IID de�i�kenine ata
for /f "tokens=3" %%i in ('cscript %SystemRoot%\system32\slmgr.vbs /dti ^| find ": "') do set "IID=%%i"

echo IID kodu: %IID%
echo IID kodu: %IID% > IID_windows.txt

rem URL ve giri� bilgilerini tan�mlay�n
set "url=https://getconfirmationid.com/ajax/cidms_api?iids=%IID%&username=trogiup24h&password=PHO"
set "username=trogiup24h"
set "password=PHO"

rem JSON verisini indirin ve dosyaya kaydedin
curl -u "%username%:%password%" -o response.json "%url%" --ssl-no-revoke 


for /f "tokens=5 delims=:," %%j in ('find "result" response.json') do set "CIDDurum=%%j"
set "CIDDurum=%CIDDurum:"=%"
::echo %CIDDurum%
set "CID=null"

::echo %CID%
if "%CIDDurum%" == "Successfully" (
  for /f "tokens=23 delims=:," %%c in ('find "confirmation_id_no_dash" response.json') do set "CID=%%c"

  
) else (
  echo CID kodu al�namad�. Girilen Y�kleme Kimli�ine ait Lisans anahtar� ge�ersiz veya hatal� olabilir.
)
rem CID kodundan " i�aretini siler
set "CID=%CID:"=%"
::set "CID=%CID:~1,-1%" <<<<<<<<<<<<bu kod da ilk ve son karakteri siler.


rem "CID" de�i�keni ekrana yazd�r�l�r
echo CID kodu: %CID%
echo CID kodu: %CID% > CID_windows.txt




::***********************************************************************************************************************************************************
rem/||(
::�ALI�IYOR.... BA�TAN 43. karakterden sonra 55 karakteri tan�yor.
for /f "tokens=*" %%a in ('findstr /i "Confirmation ID (CID):\r\n" response.json') do set "CID=%%a"
set "CID=%CID:~43,55%"
set "CID=%CID:-=%"
echo %CID%
)

rem/||(

::response.json i�erisinden 2. tokende Confirmation ID (CID) varsa anahtar� veriyor yoksa null olarak bo� veriyor.
rem CIDDurum de�i�keni Successfully ise CID de�i�kenine ata
for /f "tokens=2 delims=:," %%j in ('find "short_result" response.json') do set "CIDDurum=%%j"
set "CIDDurum=%CIDDurum:"=%"
::echo %CIDDurum%
set "CID=null"
if "%CIDDurum%" == "Confirmation ID (CID)" (
	for /f "tokens=*" %%a in ('findstr /i "Confirmation ID (CID):\r\n" response.json') do set "CID=%%a"
	set "CID=%CID:~43,55%"
	set "CID=%CID:-=%"
  
) else (
  echo CID kodu al�namad�. Girilen Y�kleme Kimli�ine ait Lisans anahtar� ge�ersiz veya hatal� olabilir.
)
	echo %CID%

)

pause