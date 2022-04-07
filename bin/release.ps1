$cmdFile = $MyInvocation.MyCommand.Definition
$cmdPath = [System.IO.Path]::GetDirectoryName($cmdFile)
$logFIle = $cmdPath+"\release" + (Get-Date -Format yyMMddHHmmss) + ".txt"
Set-Location  $cmdPath/..
<#
$cmdPath = Split-Path -Parent $cmdFile
$hash= @{Format='yyMMddHHmmss'}
$tims = Get-Date @hash
$tims = Get-Date -Format yyMMddHHmmss
$logFIle = $cmdPath+'\release'+ (Get-Date @hash) +'.txt'
echo $logFIle
#>
$mvnCmd = mvn clean source:jar deploy 
$mvnCmd | tee $logFIle
pause