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
call :setESC

:: color help <<<<<<<<<<<<<<<<<<b�t�n renk bilgileri i�in cmd ekran�na yaz
:: color [arkaplanrengi][yaz�rengi]
::color 1F
mode con lines=20 cols=150



::https://support.microsoft.com/tr-tr/windows/windows-i%C3%A7in-%C3%BCr%C3%BCn-etkinle%C5%9Ftirme-%C3%A7evrimi%C3%A7i-ve-destek-telefon-numaralar%C4%B1-35f6a805-1259-88b4-f5e9-b52cccef91a0
::https://www.sordum.net/18265/windows-aktivasyon-durumunuz-nedir/
::https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/dn502540(v=ws.11)
::https://docs.microsoft.com/en-us/windows-server/get-started/activation-slmgr-vbs-options

:: GLOBAL SETTINGS FOR slmgr.vbs
:: https://docs.microsoft.com/en-us/windows-server/get-started/activation-slmgr-vbs-options
setlocal
call :setESC

cls

cd %windir%\system32


title Windows S�r�mleri �evrimi�i ve �evrimd��� CMD ile Etkinle�tirme Arac�&

echo ************************************&

echo %ESC%[101;93mNot: Bu script sadece var olan lisans anahtar�n�z� sisteme cmd �zerinden i�lenmesini ve sistemin aktivasyonunu sa�lar.%ESC%[0m
echo %ESC%[101;93mK�saca KMS vb. lisans anahtar� girmez vb. i�lemler y�r�tmez.%ESC%[0m
echo.&
echo.&
echo Written by %ESC%[101;93m@BoomBookTR%ESC%[0m
echo.&
echo https://github.com/BoomBookTR/Windows-Legal-Activation-Script
echo.&
echo Telegram Kanal�: https://t.me/windows_office_etkinlestir
echo Telegram Grubu: https://t.me/windows_office_etkinlestirme

echo.&
echo.&
echo ************************************&
echo ************************************&

echo Desteklenen S�r�mler:&
echo - Windows 11 T�m�&
echo - Windows 10 T�m�&
echo - Windows 8.1 T�m�&
echo - Windows 7 T�m�&
echo.&
echo.&
echo ************************************ &

:: cscript //nologo slmgr.vbs /xpr (show license)
:: cscript //nologo slmgr.vbs /dlv (show full license)
:: cscript //nologo slmgr.vbs /dli (show full license)
:: cscript //nologo slmgr.vbs /ipk (install product key)
:: cscript //nologo slmgr.vbs /upk (uninstall product key)
:: cscript //nologo slmgr.vbs /cpky (uninstall product key from Registry)
::slmgr /ckms
:: cscript //nologo slmgr.vbs  /ckms
:: cscript //nologo slmgr.vbs  /skhc


:secim
set /P c=Y�klenmi� t�m lisans anahtar� silinecektir. Devam etmek istedi�ine emin misin [E/H]?
if /I "%c%" EQU "E" goto :devamet
if /I "%c%" EQU "H" goto :devametme
goto :secim

:devamet
echo ============================================================================&

:secim-onay
::choice /n /c EH /m "Y�klenmi� lisans anahtar� silinecektir. Onayl�yor musunuz [E/H]?" & if errorlevel 2 goto :offline
set /P d=%ESC%[101;93mY�klenmi� lisans anahtar� silinecektir. Onayl�yor musunuz [E/H]?%ESC%[0m
if /I "%d%" EQU "E" goto :lisanssil
if /I "%d%" EQU "H" goto :devametme
goto :secim-onay

echo ============================================================================&

:lisanssil
::Varolan etkinle�tirme anahtar�n� sil
echo Y�klenmi� Lisans Anahtar� Siliniyor...&
cscript //nologo %SystemRoot%\system32\slmgr.vbs -upk
::Kay�t defterinden lisans bilgilerini sil.
:: cscript //nologo %SystemRoot%\system32\slmgr.vbs /cpky
cscript //nologo %SystemRoot%\system32\slmgr.vbs /cpky
echo ============================================================================&


::Lisans anahtar�n� ekle
set /p LicenseKey=Lisans Anahtar� Gir:
cscript //nologo %SystemRoot%\system32\slmgr.vbs -ipk %LicenseKey%



echo ************************************ &
echo.&
echo.&
echo ============================================================================&
echo Windows Etkinle�tirilecektir...&
echo ============================================================================&
echo.&
echo.&
echo ************************************ &

:yontem
::choice /n /c EH /m "Windows �evrimi�i (E) mi �evrimd��� (H) m� etkinle�tirilsin [E/H]?" & if errorlevel 2 goto :offline
set /P s=%ESC%[101;93mWindows �evrimi�i (E) mi etkinle�tirilecek [E/H]?%ESC%[0m
if /I "%s%" EQU "E" goto online
if /I "%s%" EQU "H" goto offline
goto :yontem


:online
::Online Activation
::KMS veya MAK anahtar�yla aktivasyon ger�ekle�tirir.
cscript //nologo %SystemRoot%\system32\slmgr.vbs /ato | find /i "�r�n ba�ar�yla etkinle�tirildi" && (echo.&echo ************************************************* &echo.&choice /n /c HE /m "Aktivasyon ba�ar�l�...Kapatmak istiyor musunuz? (E/H)" & if errorlevel 2 goto :devametme) || (echo Aktivasyon Ba�ar�s�z...! Yeniden ba�lan�yor...) &

:secim-tb
set /P t=Tekrar dene/Ba�a D�n [T/B]?
if /I "%t%" EQU "T" goto :online
if /I "%t%" EQU "B" goto :atlaonline
goto :secim-tb

:atlaonline
set /P b=Aktivasyon i�lemine yeniden ba�lanarak devam edilecektir. Tekrar ba�lans�n m� [E/H]?
if /I "%b%" EQU "E" goto :secim
if /I "%b%" EQU "H" goto :devametme
goto :atlaonline

:offline
::Offline Activation
::Y�kleme ID g�sterir
cscript %SystemRoot%\system32\slmgr.vbs /dti > "%~dp0"\IID_windows.txt
::pushd "%~dp0"
::start IID_windows.txt

rem Komut ��kt�s�n� IID de�i�kenine ata
for /f "tokens=3" %%i in ('cscript %SystemRoot%\system32\slmgr.vbs /dti ^| find ": "') do set "IID=%%i"


echo.
echo.
echo.
echo IID kodu: %IID%
::echo IID kodu: %IID% > IID_windows.txt

rem URL ve giri� bilgilerini tan�mlay�n
set "url=https://pidkey.com/ajax/cidms_api?iids=%IID%&username=trogiup24h&password=PHO"
::set "url=https://getconfirmationid.com/ajax/cidms_api?iids=%IID%&username=trogiup24h&password=PHO"
set "username=trogiup24h"
set "password=PHO"
::Alternatif Yollar.
::https://pidkey.com/apis
::https://pidkey.com/ajax/cidms_api?iids=%IID%&username=trogiup24h&password=PHO
::Sayfa cevab�: {"short_result":"Confirmation ID (CID):\r\n033815-357101-860630-218090-894495-243386-132221-970210","result":"Successfully","typeiid":1,"is_chat_ms":0,"confirmationid":"033815-357101-860630-218090-894495-243386-132221-970210","confirmationid_chat_ms":"","have_cid":1,"ultimate_cid":null,"ultimate_have_cid":-1,"confirmation_id_with_dash":"033815-357101-860630-218090-894495-243386-132221-970210","confirmation_id_no_dash":"033815357101860630218090894495243386132221970210","error_executing":null,"had_occurred":0}

::https://khoatoantin.com/apis
::https://khoatoantin.com/ajax/cidms_api?iids=%IID%&username=trogiup24h&password=PHO
::Sayfa cevab�: {"short_result":"Confirmation ID (CID):\r\n033815-357101-860630-218090-894495-243386-132221-970210","result":"Successfully","typeiid":1,"is_chat_ms":0,"confirmationid":"033815-357101-860630-218090-894495-243386-132221-970210","confirmationid_chat_ms":"","have_cid":1,"ultimate_cid":null,"ultimate_have_cid":-1,"confirmation_id_with_dash":"033815-357101-860630-218090-894495-243386-132221-970210","confirmation_id_no_dash":"033815357101860630218090894495243386132221970210","error_executing":null,"had_occurred":0}


::BUNDA FARKLI KOD KULLANILMALI ALTTAK� ��E YARAMAZ. response.json yok yani.
::https://pidkey.vip/GetCID.aspx?id=GetCID&pass=GetCID&iid=%IID%
::Sayfa Kayna��: 033815-357101-860630-218090-894495-243386-132221-970210

::https://kichhoat24h.com/apis
::https://kichhoat24h.com/user-api/get-cid?iid=%IID%&price=0.5&token=[token_id]&send_to_email=[send_to_email]&callback_url=[callback_url]
::https://kichhoat24h.com/user-api/get-cid?iid=%IID%&price=0.5&token=[token_id]


::BUNDA DA FARKLI KOD KULLANILMALI ALTTAK� ��E YARAMAZ. c_cid k�sm�n�n alttaki kodda confirmation_id_no_dash ile de�i�tirilmesi gerekiyor.(Belki daha fazlas�.)
::https://getcid.xyz/api
::https://bs.getcid.xyz/webapi/get-cid/?autocall=1&iid=%IID%
::iid (mandatory): Your installation ID. You can send it with or without hyphens.
::autocall (optional, default 1): You can set autocall to 0 if you just want to get information without making a call.
::onlycid (optional, default 0): You can set onlycid to 1 if you want the user information not to be included.
::Valid examples:
::https://bs.getcid.xyz/webapi/get-cid/?autocall=0&iid=%IID%
::https://bs.getcid.xyz/webapi/get-cid/?onlycid=1&iid=%IID%
::https://bs.getcid.xyz/webapi/get-cid/?token=************************************************&iid=%IID%
::      {
::        "cid": "435504-697485-138242-433182-497552-083534-176493-978266",
::        "c_cid": "435504697485138242433182497552083534176493978266",
::        "user_data": {
::          "credit": 100.0,
::          "autocall_price": 0.5
::        },
::      }

rem JSON verisini indirin ve dosyaya kaydedin
curl -u "%username%:%password%" -o %~dp0response.json "%url%
if %ERRORLEVEL% == 3 goto :CIDGir
if %ERRORLEVEL% == 6 goto :CIDGir
::Hatalar
::curl: (3) URL using bad/illegal format or missing URL
::curl: (6) Could not resolve host: not
::curl: (6) Could not resolve host: resolve
::curl: (3) URL using bad/illegal format or missing URL



rem CIDDurum de�i�keni Successfully ise CID de�i�kenine ata
for /f "tokens=5 delims=:," %%j in ('find "result" %~dp0response.json') do set "CIDDurum=%%j"

set "CIDDurum=%CIDDurum:"=%"
::echo %CIDDurum%
set "CID=null"
::echo %CID%


if "%CIDDurum%" == "Successfully" (
  for /f "tokens=23 delims=:," %%c in ('find "confirmation_id_no_dash" %~dp0response.json') do set "CID=%%c"

  
) else (
echo CID kodu al�namad�. Girilen Y�kleme Kimli�ine ait Lisans anahtar� ge�ersiz veya hatal� olabilir.

echo MS ^(Microsoft^) hesab�n�za ba�l� bir lisans anahtar�yla otomatik etkinle�tirilmi�se de CID koduna ula��lamayabilir.
)

rem CID kodundan " i�aretini siler
set "CID=%CID:"=%"
::alttaki kod da ilk ve son karakteri siler.
::set "CID=%CID:~1,-1%" 



echo.
echo.
echo.
rem "CID" de�i�keni ekrana yazd�r�l�r
echo CID kodu: %CID%
echo CID kodu: %CID% > CID_windows.txt




::Onaylama ID (CID)y�kler ve aktif eder. 
::CID anahtar�n� ekle
::set /p CIDkey=CID Gir:
::set "CIDkey=%CID%"
:CIDGir
if "%CID%" == "" (
  set /p CIDkey=CID Gir:
) else if /i "%CID%" == "null" (
  set /p CIDkey=CID Gir:
) else (
  set "CIDkey=%CID%"
)


cscript //nologo %SystemRoot%\system32\slmgr.vbs /atp %CIDkey%
cscript //nologo %SystemRoot%\system32\slmgr.vbs /ato | find /i "�r�n ba�ar�yla etkinle�tirildi" && (echo.&echo ************************************************* &echo.&choice /n /c HE /m "Aktivasyon ba�ar�l�...Kapatmak istiyor musunuz? (E/H)" & if errorlevel 2 goto :devametme) || (echo Aktivasyon Ba�ar�s�z...! Yeniden ba�lan�yor...) &

:secim-tb
set /P t=Tekrar dene/Ba�a D�n [T/B]?
if /I "%t%" EQU "T" goto :offline
if /I "%t%" EQU "B" goto :atlaoffline
goto :secim-tb

:atlaoffline
set /P b=Aktivasyon i�lemine yeniden ba�lanarak devam edilecektir. Tekrar ba�lans�n m� [E/H]?
if /I "%b%" EQU "E" goto :secim
if /I "%b%" EQU "H" goto :devametme
goto :atlaoffline



:devametme
Echo ��lem Tamamland�...

echo ============================================================================&

::Lisans Bilgisini Al
::cscript //nologo slmgr.vbs /dli

::Detayl� Lisans Bilgisini Al
cscript //nologo slmgr.vbs /dlv

::Detayl� Lisans Bilgisini Al
::cscript //nologo slmgr.vbs /dlv

::Detayl� Lisans Bilgisini Al
::cscript //nologo slmgr.vbs /dlv all

Echo Ba�ka bir i�leminiz yok ise pencereyi kapatabilirsiniz.
cmd /k

:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
  exit /B 0
)
exit /B 0




::****************************KOD B�T��**********************************
::****************************KOD B�T��**********************************