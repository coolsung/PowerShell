## To Enable or Disable SSH Service
#--- vCenter Server


## Connect vCenter Server

$esxHosts = get-VMHost | Sort-Object name

foreach ($esx in $esxHosts) {


    ## Start SSH Service
    Write-Host "Enalbe SSH on $esx" -ForegroundColor Green
    Get-VMHostService -VMHost $esx | ?{$_.Label -eq "SSH"} | Start-VMHostService
    Get-VMHostService -VMHost $esx | ?{$_.Label -eq "SSH"} | Set-VMHostService -Policy "On" -Confirm:$false
    Get-VMHostService -VMHost $esx | ?{$_.Label -eq "SSH"} | Restart-VMHostService -Confirm:$false
    #### Disable Alarm Message
    Get-VMHost $esx | Get-AdvancedSetting UserVars.SuppressShellWarning | Set-AdvancedSetting -Value 1 -Confirm:$false


<#
    ## Stop SSH Sevice
    Write-Host "Disable SSH on $esx" -ForegroundColor Green
    Get-vmhostservice -vmhost $esx | ?{$_.Label -eq "SSH"} | Stop-VMHostService -confirm:$false
    Get-VMHostService -VMHost $esx | ?{$_.Label -eq "SSH"} | Set-VMHostService -Policy "Off" -Confirm:$false
    #### Enable Alarm Message
    Get-VMHost $esx | Get-AdvancedSetting UserVars.SuppressShellWarning | Set-AdvancedSetting -Value 0 -Confirm:$false
#>
}

