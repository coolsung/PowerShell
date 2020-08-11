# ESXi Host의 Standard Switch 생성.


$vSSName = "Services"           ## 신규 생성 되는 Standard Switch 이름
$vmNicNum = "vmnic2","vmnic3"   ## 생성 되는 Standard Switch의 Uplink로 사용 되는 NIC Port.
$MTU = "9000"


$esxHosts = Get-VMHost          ## ESXi Host 대상 입력.


foreach ($esx in $esxHosts) {

    Write-Host "Creating $vSSname of $vmNICnum on $esx" -ForegroundColor Green
    Get-VMHost $esx | New-VirtualSwitch -Name $vSSName -Nic $vmNICnum -Mtu $MTU

}