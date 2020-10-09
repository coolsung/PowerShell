
$VMHost ='rm-comp01.darkblack.lab'

$esxcli = Get-EsxCli -VMHost $VMhost -V2
$esxcli.network.ip.netstack.add.invoke(@{netstack = "vmotion"})