# PowerCLI Script to Configure DNS and NTP on ESXi Hosts

#Prompt for Primary and Alternate DNS Servers
#$dnsPri = read-host "Enter Primary DNS"
#$dnsalt = Read-Host "Enter Alternate DNS"

$dnsPri = "172.25.1.11"
$dnsAlt = "172.25.1.12"

$DomainName = "darkblack.lab"

#$ClusterName = ""
#$esxHosts = Get-Cluster $ClusterName | Get-VMHost

$esxHosts = Get-VMHost

foreach ($esx in $esxHosts) {
    Write-host "Configuring DNS and Domain Name on $esx" -ForegroundColor Green
    Get-VMHostNetwork -VMHost $esx | Set-VMHostNetwork -DomainName $DomainName -DnsAddress $dnsPri, $dnsAlt -confirm:$false
}

Write-Host "Done!!!!" -ForegroundColor DarkRed
