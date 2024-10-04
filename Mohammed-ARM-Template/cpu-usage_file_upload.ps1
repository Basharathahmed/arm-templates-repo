
$localFilePath = "C:\Windows\cpu_usage.txt"
$storageAccountName = "file45"
$containerName= "sample21"
$blobName ="cpu_usage.txt"
$accesskey = ""

$tenantId = ""
$applicationId = ""
$clientSecret = ""


#Az Login
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile azure-cli-installer.msi

Start-Process msiexec.exe -ArgumentList '/I azure-cli-installer.msi /quiet' -NoNewWindow -Wait


Write-Output "$blobName is save into the $storageAccountName/$containerName"
