## DarkBlack.Dev
## Last OS Boot Time for VM

$Stat = 'sys.osuptime.latest'

$Now = Get-Date
$VMs = Get-VM

Get-Stat -Entity $VMs -Stat $stat -Realtime -MaxSamples 1 |

Select-Object @{N='VM';E={$_.Entity.Name}},
    @{N='LastOSBoot';E={$now.AddSeconds(- $_.Value)}},
    @{N='UptimeDays';E={[math]::Floor($_.Value/(24*60*60))}} # 24 Hours * 60 Min * 60 Sec
