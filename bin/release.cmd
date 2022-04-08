@set cmdFile=%~dp0
@cd /d %cmdFile%..
@set logFile=release%date:~2,2%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%.log
@mvn clean deploy > bin\%logFile%
@pause
