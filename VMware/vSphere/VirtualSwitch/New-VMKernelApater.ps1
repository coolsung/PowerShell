## vCenter Server에 접속 하여 CSV 파일 목록에 있는 서버 대상으로 vMotion Network 생성.
## 

$CSVPath = "C:\VMware\ESXiHost_Test.csv"
$vSwitchNum = "vMotion"
$vMotionPGname = "vMotion"

#--- vCenter Server
$vCenterServer = "GameOn-vCenter.shk.lab"
$vCenterServerAdmin = "administrator@vsphere.local"
$vCenterServerPW = "VMware1!"

## Connect vCenter Server
Connect-VIServer -Server $vCenterServer -User $vCenterServerAdmin -Password $vCenterServerPW


$Import_CSVPatch = Import-csv $CSVPath

foreach ($CSV in $Import_CSVPatch) {
    $FailureList = ""
    $Hostname = $CSV.Hostname
    $Domain = $CSV.Domain
    $vMotionVLAN = $CSV.vMotionVLAN
    $vMotionIP = $CSV.vMotionIP
    $vMotionSubnet = $CSV.vMotionSubnet

    $FQDN = $Hostname+"."+$Domain

    Write-Host "Creating for vMotion -IP: $vMotionIP -Host: $FQDN" -ForegroundColor Green

    # Create vMotion Port Group
    New-VMHostNetworkAdapter -VMHost (Get-VMHost -Name $FQDN) -PortGroup $vMotionPGname -VirtualSwitch $vSwitchNum -IP $vMotionIP -SubnetMask $vMotionSubnet -FaultToleranceLoggingEnabled:$false -ManagementTrafficEnabled:$false -VsanTrafficEnabled:$false -VMotionEnabled:$true -MTU 1500
        
    # Set vMotion VLAN
    $VMotionPG = Get-VirtualPortgroup -Name $vMotionPGname
    Set-VirtualPortGroup -VirtualPortGroup $VMotionPG -VlanId $vMotionVLAN
}

Disconnect-VIServer -Confirm:$false
