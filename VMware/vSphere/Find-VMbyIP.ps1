$VMIPAddress = "172.25.1.11"

$list = Get-View -ViewType VirtualMachine | Select-Object name,@{N='IP';E={[string]::Join(',',$_.Guest.ipaddress)}}
$list | Where-Object { $_.ip -eq $VMIPAddress }