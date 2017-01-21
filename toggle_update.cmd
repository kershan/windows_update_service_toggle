@ECHO OFF
SET /P answer=Are you sure you want to toggle Windows Update Service? (y or n):
IF "%answer%"=="y" (
	@ECHO ON

	NET START wuauserv || NET STOP wuauserv
	NET START bits || NET STOP bits
	NET START dosvc || NET STOP dosvc

	@ECHO OFF
)
SET /P answer=Do you want to restart now? (y or n):
IF "%answer%"=="y" (
	ECHO "Restarting in a minute!"
	SHUTDOWN -r -t 60
) ELSE (
	ECHO "Restart later to make sure the the update service is working correctly"
)
PAUSE