# vCenter Server에 등록된 모든 ESXi Host에 대해서 NTP 정보를 삭제 하고 새로 등록 합니다.




$NTPServers = "time.bora.net", "time.google.com"


$esxHosts = Get-VMHost

#No need to edit anything below this line
#====================================
foreach ($esx in $esxHosts){
    $AllNTP = Get-VMHostNtpServer -VMHost $esx
    foreach ($ThisNTP in $AllNTP){
        Write-Host "Removing $ThisNTP from $esx" -ForegroundColor Yellow
        Remove-VMHostNtpServer -VMHost $esx -ntpserver $ThisNTP -Confirm:$false

    }
    foreach ($ThisNTP in $NTPServers){
        Write-Host "Adding $ThisNTP to $esx" -ForegroundColor Green
        add-vmhostntpserver -VMHost $esx -ntpserver $ThisNTP -Confirm:$false
    }

    Write-Host "Configuring NTP Client Policy on $esx" -ForegroundColor Green
    Get-VMHostService -VMHost $esx | where{$_.Key -eq "ntpd"} | Set-VMHostService -Policy "on" -Confirm:$false

    Write-Host "Restaring NTP Client  on $esx" -ForegroundColor Green
    Get-VMHostService -VMHost $esx | where{$_.Key -eq "ntpd"} | Restart-VMHostService -Confirm:$false


    Write-Host "=========================================================================================" -ForegroundColor Cyan
}

