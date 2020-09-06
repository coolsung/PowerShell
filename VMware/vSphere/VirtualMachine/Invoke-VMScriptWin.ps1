#
#

$TargetVMs = "VDI-*"            ## VM 이름이 "VDI-"로 시작 하는 대상.

$scriptGPU = "%SystemRoot%\System32\gpupdate.exe /force"        ## GPupdate을 실행 해서 AD 정책을 업데이트
$scriptWSUS = "%SystemRoot%\System32\wuauclt.exe /detectnow"    ## WSUS에 Client 등록.

$VmOsAccount = "doamin\administrator"
$VmOsPassword = "VMware1!"



ForEach ($VM in Get-VM | Where-Object {$_.Name -like $TargetVMs} | Sort-Object){

    Invoke-VMScript -ScriptText $scriptGPU -VM $VM -GuestUser $VmOsAccount -GuestPassword $VmOsPassword -ScriptType Bat -RunAsync
    #Invoke-VMScript -ScriptText $scriptWSUS -VM $VM -GuestUser $VmOsAccount -GuestPassword $VmOsPassword -ScriptType Bat -RunAsync

    Start-Sleep -Seconds 1
    $VM

}