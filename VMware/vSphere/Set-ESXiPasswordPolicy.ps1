# Set the ESXi Password Policy
# Default Password Policy ESXi 6 = retry=3 min=disabled, disabled, disabled, 7, 7
# Default Password Policy ESXi 5 = retry=3 min=8,8,8,7,6



$PasswordPolicy = "retry=3 min=8,8,8,7,6"
$VMHosts = Get-VMHost | Where-Object { $_.ConnectionState -eq "Connected" } ## ESXi Host가 정상 연결된 대상.
foreach ($VMHost in $VMHosts){
    $VMHosts | Get-AdvancedSetting -Name "Security.PasswordQualityControl" | Set-AdvancedSetting -Value $PasswordPolicy -Confirm:$false
}