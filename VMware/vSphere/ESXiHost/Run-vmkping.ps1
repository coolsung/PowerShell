$esxcli = Get-EsxCli -VMHost (Get-VMHost "rm-comp02.darkblack.lab") -V2
$params = $esxcli.network.diag.ping.CreateArgs()
$params.host = '172.25.1.1'
$params.interface  = 'vmk0'
$params.size = '1472' #use 1472 for 1500 MTU or 8972 for 9000 MTU (VMware uses these values on MTU pings on ESXi)
#$params.netstack = 'vmotion'
$res = $esxcli.network.diag.ping.Invoke($params)
$res.summary

<#
$esxcli.network.diag.ping.Help()

=================================================================================================================================================================================================
vim.EsxCLI.network.diag.ping
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
Send ICMP echo requests to network hosts.
Param
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 
- count              | Specify the number of packets to send.
- debug              | VMKPing debug mode.
- df                 | Set DF bit on IPv4 packets.
- host               | Specify the host to send packets to. This parameter is required when not executing ping in debug mode (-D)
- interface          | Specify the outgoing interface.
- interval           | Set the interval for sending packets in seconds.
- ipv4               | Ping with ICMPv4 echo requests.
- ipv6               | Ping with ICMPv6 echo requests.
- netstack           | Specify the TCP/IP netstack which the interface resides on
- nexthop            | Override the system's default route selection, in dotted quad notation. (IPv4 only. Requires interface option)
- size               | Set the payload size of the packets to send.
- ttl                | Set IPv4 Time To Live or IPv6 Hop Limit
- wait               | Set the timeout to wait if no responses are received in seconds.
#>