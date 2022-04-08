$cmdFile = $MyInvocation.MyCommand.Definition
$cmdPath = [System.IO.Path]::GetDirectoryName($cmdFile)
$logFile = $cmdPath+"\release" + (Get-Date -Format yyMMddHHmmss) + ".log"
Set-Location  $cmdPath/..
<#
$cmdPath = Split-Path -Parent $cmdFile
$hash= @{Format='yyMMddHHmmss'}
$tims = Get-Date @hash
$tims = Get-Date -Format yyMMddHHmmss
$logFIle = $cmdPath+'\release'+ (Get-Date @hash) +'.txt'
echo $logFIle
#>
$mvnCmd = mvn -X clean deploy 
$mvnCmd | tee $logFile
pause