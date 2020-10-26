
$Stoploop = $false
[int]$Retrycount = "0"
 
do {
try {
hostname > .\output
date >> .\output
#Write-Host "Job completed"
$Stoploop = $true
}
catch {
if ($Retrycount -gt 3){
Write-Host "Could not send Information after 3 retrys."
$Stoploop = $true
}
else {
#Write-Host "Could not send Information retrying in 5 seconds..."
Start-Sleep -Seconds 5
$Retrycount = $Retrycount + 1
}
}
}
While ($Stoploop -eq $false)
