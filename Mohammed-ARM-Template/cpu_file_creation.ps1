# Variable contents
$vmName = "samplevm01"
$localFilePath = "C:\Windows\cpu_usage.txt"
$storageAccountName = "samplefiles1"
$containerName= "multicommand"
$blobName ="cpu_usage.txt"
 
$samplevalue="Hello World!"
 
$samplevalue | Out-File -FilePath $filecontent
 
$cpuCounterPath = "\Processor(_Total)\% Processor Time"
 
$cpuUsage = Get-Counter -Counter $cpuCounterPath
 
$cpuUsageValue = $cpuUsage.CounterSamples.CookedValue
 
Write-Output "Current CPU Usage: $cpuUsageValue%"
 
$filecontent = "$samplevalue -- Current CPU Usage: $cpuUsageValue%"
 
$filecontent | Out-File -FilePath $localFilePath -Append