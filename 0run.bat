@echo off
netsh wlan show profiles > profiles_wifi.txt
findstr "Tutti" "profiles_wifi.txt" > find.txt
setlocal EnableDelayedExpansion
set /a count=0

FOR /F "tokens=6-8" %%a IN ('type find.txt') DO (
	set /a count+=1
	set "Line[!count!]=%%a"
)
for /L %%i in (1,1,%Count%) do (
REM	echo l'indice "%%i" contiene "!Line[%%i]!"
REM	echo !Line[%%i]!
	netsh wlan show profiles !Line[%%i]! key=clear >!Line[%%i]!.txt 
)
Del find.txt
Del profiles_wifi.txt
