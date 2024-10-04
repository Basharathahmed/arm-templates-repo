
$localFilePath = "C:\Windows\cpu_usage.txt"
$storageAccountName = "file45"
$containerName= "sample21"
$blobName ="cpu_usage.txt"
$accesskey = ""

$tenantId = ""
$applicationId = ""
$clientSecret = ""

Start-Sleep -Seconds 50

#Az Login
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12


&"C:\Program Files (x86)\Microsoft SDKs\Azure\CLI2\wbin\az" login --service-principal -u $applicationId -p $clientSecret --tenant $tenantId

&"C:\Program Files (x86)\Microsoft SDKs\Azure\CLI2\wbin\az" storage blob upload --account-name $storageAccountName --account-key $accesskey --container-name $containerName --file $localFilePath

Write-Output "$blobName is save into the $storageAccountName/$containerName"
