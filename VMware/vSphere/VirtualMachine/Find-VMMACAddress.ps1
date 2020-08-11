Get-VM | 
  Get-NetworkAdapter | 
  Where-Object {$_.MacAddress -eq "00:50:56:96:d4:ce"} | 
  Format-List -Property *