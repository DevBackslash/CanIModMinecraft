@echo off
title Minecraft Toolkit (Pre-Release)
set Minecraft=%appdata%\.minecraft\
set MinecraftMods=%appdata%\.minecraft\mods 
set MinecraftWorlds=%appdata%\.minecraft\saves
set Java=C:\Program Files\Java
set Minecraft1-16-5=%appdata%\.minecraft\versions\1.16.5
set Versions=%appdata%\.minecraft\versions\
call :colorEcho 0C "This tool is made for Minecraft Java (with Forge) 1.16.5"
echo.

		if exist %Minecraft% (
			call :colorEcho 0A "[+] Minecraft has been found!"
            echo.
	
				) else (
					call :colorEcho 0C "[-] Minecraft not found! Please install Minecraft to use this."
                    pause>nul
                    exit
    		
    )		
)

if exist %Minecraft1-16-5% (
			call :colorEcho 0A "[+] Minecraft 1.16.5 has been found!"
            echo.
            
	
				) else (
					call :colorEcho 0C "[-] Minecraft 1.16.5 has not been found! Installing it for you..."
                    cd %versions%
                    md 1.16.5
                    cd 1.16.5
                    powershell -Command "Invoke-WebRequest https://launcher.mojang.com/v1/objects/37fd3c903861eeff3bc24b71eed48f828b5269c8/client.jar -OutFile 1.16.5.jar"
                    
                
               
    )                
)                
:minecraftmods
echo.
if exist %MinecraftMods% (
			call :colorEcho 0A "[+] Minecraft mods folder has been found!"
            echo.
	
				) else (
					call :colorEcho 0C "[-] Minecraft mods folder has not been found! Creating one for you..."
                    cd %Minecraft%
                    md mods
                    
                    goto :minecraftmods
    		
    )		
)

if exist %Java% (
			call :colorEcho 0A "[+] Java has been found!"
            echo.
            goto :FileCheckDownload
	
				) else (
					call :colorEcho 0C "[-] Java has not been found. It is not required but is recommended."
                    goto :FileCheckDownload
    		
    )		
)
rem Currently Broken!
echo.
:FileCheckDownload
echo Downloading and starting FileCheck . . .
call :colorEcho 0C "Make sure you have a internet connection! Your download will start in 5 seconds."
cd %TEMP%
powershell -Command "Invoke-WebRequest https://download941.mediafire.com/jayz5c7uzw3g/jeqrzn2g57cix8c/fc.bat -OutFile fc.bat"
echo.
%TEMP%\fc.bat

pause
:colorEcho
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do set "DEL=%%a"
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i