# Virtual Machine Port Group for a Standard Switch


$Cluster = "RM-COMP-CS"
$vSwitch = "vSwitch0"
$PGName = "vSS_172.25.1.x/24_V2501_MGMT"
$PGVLANID = "2501"

$VMhosts = Get-Cluster $cluster | Get-VMhost
#$VMhosts = "rm-comp01.darkblack.lab"

ForEach ($VMhost in $VMhosts){

    Get-VirtualSwitch -VMhost $vmhost -Name $vSwitch | New-VirtualPortGroup -Name $PGName -VlanId $PGVLANID
    #Get-VirtualSwitch -VMhost $vmhost -Name $vSwitch | Get-VirtualPortGroup
}


