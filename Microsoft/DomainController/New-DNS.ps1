#Script to add DNS 'A' Records 'PTR' Records to DNS Servers


$DNSUser = "cnd\sunghwan.kim"
$DNSPassword = "2Tech22@"

$DNSServer = "HQ-DC01.cnd.lab"
$DNSZone = "cnd.lab"
$Hostname = "Test"
$IPAddress = "172.18.1.255"


Enter-PSSession -ComputerName $DNSServer -GuestCredential $creds
#Import-Module DnsServer
Add-DnsServerResourceRecordA –ComputerName $DNSServer -Name $Hostname -IPv4Address $IPAddress -ZoneName $DNSZone -CreatePtr

<#
http://kunaludapi.blogspot.com/2015/11/powershell-add-resource-records-in-dns.html
#>