## VMware ESXi Host에서 Error 로그만 추출.


#$Hosts = get-vmhost | sort name
$Hosts = "prd08-comp08.hntcorp.net"


foreach ($eachHost in $Hosts) {

    Write-Host "$eachhost" -ForegroundColor Yellow


    (Get-Log -VMHost (Get-VMHost $eachHost) vmkernel).Entries | Where-Object {$_ -like “*Error*“} | Out-File C:\VMware\Output\Host-Error\$eachHost.log

}

