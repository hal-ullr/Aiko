@SETLOCAL ENABLEDELAYEDEXPANSION
@ECHO OFF

GOTO :Main

:Lower
	SET %~1=!%1:A=a!
	SET %~1=!%1:B=b!
	SET %~1=!%1:C=c!
	SET %~1=!%1:D=d!
	SET %~1=!%1:E=e!
	SET %~1=!%1:F=f!
	SET %~1=!%1:G=g!
	SET %~1=!%1:H=h!
	SET %~1=!%1:I=i!
	SET %~1=!%1:J=j!
	SET %~1=!%1:K=k!
	SET %~1=!%1:L=l!
	SET %~1=!%1:M=m!
	SET %~1=!%1:N=n!
	SET %~1=!%1:O=o!
	SET %~1=!%1:P=p!
	SET %~1=!%1:Q=q!
	SET %~1=!%1:R=r!
	SET %~1=!%1:S=s!
	SET %~1=!%1:T=t!
	SET %~1=!%1:U=u!
	SET %~1=!%1:V=v!
	SET %~1=!%1:W=w!
	SET %~1=!%1:X=x!
	SET %~1=!%1:Y=y!
	SET %~1=!%1:Z=z!
	GOTO:EOF

:Main
	2>NUL WHERE MOONC>nul
	IF %ERRORLEVEL% NEQ 0 (
		ECHO.
		ECHO You require the MoonScript Lua compiler ^(moonc.exe^)
		ECHO Get it here: http://moonscript.org/#installation
		ECHO.
		PAUSE
		GOTO :EOF
	)

	IF NOT "%1"=="" (
		SET ARG=%1
		CALL :Lower ARG
	)

	ECHO.

	IF "%ARG%"=="clean" (
		::ECHO Deleting wm.lua
		::DEL wm.lua
		::ECHO Deleting modules\bar.lua
		::DEL modules\bar.lua
		::ECHO Deleting modules\layouts.lua
		::DEL modules\layouts.lua
		::ECHO Deleting modules\tile.lua
		::DEL modules\tile.lua
	) ELSE (
		::MOONC wm.moon
		::MOONC modules\bar.moon
		::MOONC modules\layouts.moon
		::MOONC modules\tile.moon
	)
	GOTO :EOF