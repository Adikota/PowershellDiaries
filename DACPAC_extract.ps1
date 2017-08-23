#Set-ExecutionPolicy -ExecutionPolicy Unrestricted
Set-Location C:

$srvr = ServerName
$Db = DatabaseName


add-type -path "C:\Program Files (x86)\Microsoft SQL Server\110\DAC\bin\Microsoft.SqlServer.Dac.dll"

$setupFilePath = "C:\Program Files (x86)\Microsoft SQL Server\110\DAC\bin\sqlpackage.exe"
 
$dest = 'C:\work\'+$srvr+$Db+'Prod.dacpac'

#$cred = Get-Credential

Start-Process $setupFilePath -ArgumentList "/Action:Extract /p:VerifyExtraction=False /SourceDatabaseName:$Db /SourceServerName:$srvr /TargetFile:$dest" #-Credential $cred
