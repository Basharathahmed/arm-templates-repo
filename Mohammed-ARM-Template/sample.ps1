#Az Login
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
 
Register-PSRepository -Default

# Define paths and URLs
$providerPath = "C:\Program Files\PackageManagement\ProviderAssemblies\"
$nugetUrl = "https://onegetcdn.azureedge.net/providers/Microsoft.PackageManagement.NuGetProvider-2.8.5.208.dll"
$nugetFile = "$providerPath\Microsoft.PackageManagement.NuGetProvider.dll"

Install-Module -Name Az -AllowClobber -Force
 
Connect-AzAccount -Identity


$localFilePath = "C:\Windows\cpu_usage.txt"
$storageAccountName = "file45"
$containerName= "container"
$blobName ="cpu_usage.txt"
$ResourceGroup="Devopd-training"



# Variable contents
$localFilePath = "C:\Windows\cpu_usage.txt"
$samplevalue="Hello World!"
 
$cpuCounterPath = "\Processor(_Total)\% Processor Time"
 
$cpuUsage = Get-Counter -Counter $cpuCounterPath
 
$cpuUsageValue = $cpuUsage.CounterSamples.CookedValue
 
Write-Output "Current CPU Usage: $cpuUsageValue%"
 
$filecontent = "$samplevalue -- Current CPU Usage: $cpuUsageValue%"
 

$filecontent | Out-File -FilePath $localFilePath -Append

# Get the storage account keys
$keys = Get-AzStorageAccountKey -ResourceGroupName $ResourceGroup -Name $storageAccountName

# Output the first key

$accessKey = $keys[0].Value
Context = New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $accessKey
 
Set-AzStorageBlobContent -Container $ContainerName -File $filePath -Blob $blobName -Context $Context


Write-Output "$blobName is save into the $storageAccountName/$containerName"
