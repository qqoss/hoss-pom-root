$cmdPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
$logFile = get-date -format 'relea\seyyMMddHHmmss.\tx\t'
$mvncmd = mvn clean source:jar deploy
$mvncmd | tee $cmdPath\$logFile
pause