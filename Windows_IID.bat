:: Bu da admin yetkili al�yor.
:: Admin Yetki kodu BA�I
:: @pushd %~dp0 & fltmc | find "." && (powershell start '%~f0' ' %*' -verb runas 2>nul && exit /b)
:: Admin Yetki kodu SONU
::---------------------------------------------------
:: Admin Yetki kodu BA�I
@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
:: Admin Yetki kodu SONU
::---------------------------------------------------

:: .... your code start ....


cscript %SystemRoot%\system32\slmgr.vbs /dti > "%~dp0"\IID_windows.txt
pushd "%~dp0"
start IID_windows.txt
exit
