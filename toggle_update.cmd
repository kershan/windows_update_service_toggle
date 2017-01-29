@ECHO OFF
SET /P answer=Attempt to turn on Windows Update Service? (on or off):
IF "%answer%"=="on" (
	@ECHO ON

	NET START wuauserv
	NET START bits
	NET START dosvc

	@ECHO OFF
) ELSE IF "%answer%"=="off" (
	@ECHO ON

	NET STOP wuauserv
	NET STOP bits
	NET STOP dosvc

	@ECHO OFF
) ELSE (
	ECHO Please restart script and choose either yes or no.
)
SET /P answer=Do you want to restart now? (y or n):
IF "%answer%"=="y" (
	ECHO Restarting in a minute!
	SHUTDOWN -r -t 60
) ELSE (
	ECHO Restart later to make sure the the update service is working correctly
)
PAUSE