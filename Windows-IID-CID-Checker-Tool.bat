@echo off
setlocal EnableDelayedExpansion
call :setESC

:: color help <<<<<<<<<<<<<<<<<<btn renk bilgileri i‡in cmd ekranna yaz
:: color [arkaplanrengi][yazrengi]
::color 1F
mode con lines=20 cols=150


::curl -L "https://getconfirmationid.com/ajax/cidms_api?iids=%IID%&username=trogiup24h&password=PHO" > CID_windows.txt


rem Komut ‡ktsn IID de§iŸkenine ata
for /f "tokens=3" %%i in ('cscript %SystemRoot%\system32\slmgr.vbs /dti ^| find ": "') do set "IID=%%i"


echo.
echo.
echo.
echo IID kodu: %IID%
echo IID kodu: %IID% > IID_windows.txt

rem URL ve giriŸ bilgilerini tanmlayn
set "url=https://pidkey.com/ajax/cidms_api?iids=%IID%&username=trogiup24h&password=PHO"
::set "url=https://getconfirmationid.com/ajax/cidms_api?iids=%IID%&username=trogiup24h&password=PHO"
set "username=trogiup24h"
set "password=PHO"
::Alternatif Yollar.
::https://pidkey.com/apis
::https://pidkey.com/ajax/cidms_api?iids=%IID%&username=trogiup24h&password=PHO
::Sayfa cevab: {"short_result":"Confirmation ID (CID):\r\n033815-357101-860630-218090-894495-243386-132221-970210","result":"Successfully","typeiid":1,"is_chat_ms":0,"confirmationid":"033815-357101-860630-218090-894495-243386-132221-970210","confirmationid_chat_ms":"","have_cid":1,"ultimate_cid":null,"ultimate_have_cid":-1,"confirmation_id_with_dash":"033815-357101-860630-218090-894495-243386-132221-970210","confirmation_id_no_dash":"033815357101860630218090894495243386132221970210","error_executing":null,"had_occurred":0}

::https://khoatoantin.com/apis
::https://khoatoantin.com/ajax/cidms_api?iids=%IID%&username=trogiup24h&password=PHO
::Sayfa cevab: {"short_result":"Confirmation ID (CID):\r\n033815-357101-860630-218090-894495-243386-132221-970210","result":"Successfully","typeiid":1,"is_chat_ms":0,"confirmationid":"033815-357101-860630-218090-894495-243386-132221-970210","confirmationid_chat_ms":"","have_cid":1,"ultimate_cid":null,"ultimate_have_cid":-1,"confirmation_id_with_dash":"033815-357101-860630-218090-894495-243386-132221-970210","confirmation_id_no_dash":"033815357101860630218090894495243386132221970210","error_executing":null,"had_occurred":0}


::BUNDA FARKLI KOD KULLANILMALI ALTTAK˜ ˜žE YARAMAZ. response.json yok yani.
::https://pidkey.vip/GetCID.aspx?id=GetCID&pass=GetCID&iid=%IID%
::Sayfa Kayna§: 033815-357101-860630-218090-894495-243386-132221-970210

::https://kichhoat24h.com/apis
::https://kichhoat24h.com/user-api/get-cid?iid=%IID%&price=0.5&token=[token_id]&send_to_email=[send_to_email]&callback_url=[callback_url]
::https://kichhoat24h.com/user-api/get-cid?iid=%IID%&price=0.5&token=[token_id]


::BUNDA DA FARKLI KOD KULLANILMALI ALTTAK˜ ˜žE YARAMAZ. c_cid ksmnn alttaki kodda confirmation_id_no_dash ile de§iŸtirilmesi gerekiyor.(Belki daha fazlas.)
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
curl -u "%username%:%password%" -o response.json "%url%"


for /f "tokens=5 delims=:," %%j in ('find "result" response.json') do set "CIDDurum=%%j"
set "CIDDurum=%CIDDurum:"=%"
::echo %CIDDurum%
set "CID=null"

::echo %CID%
if "%CIDDurum%" == "Successfully" (
  for /f "tokens=23 delims=:," %%c in ('find "confirmation_id_no_dash" response.json') do set "CID=%%c"

  
) else (
  echo CID kodu alnamad. Girilen Ykleme Kimli§ine ait Lisans anahtar ge‡ersiz veya hatal olabilir.
)
rem CID kodundan " iŸaretini siler
set "CID=%CID:"=%"


echo.
echo.
echo.
rem "CID" de§iŸkeni ekrana yazdrlr
echo CID kodu: %CID%
echo CID kodu: %CID% > CID_windows.txt

pause

:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
  exit /B 0
)
exit /B 0
