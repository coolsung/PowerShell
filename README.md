﻿# PowerShell


## 1.Example
> PowerShell에 유용한 Script들을 예제를 통해서 정리.
>>
>>> - Help-CommentBasedHelp.ps1
>>>     - 새로 만든 Function에 도움말을 추가 하는 방법.
>>> - Help-FormatOperator.ps1
>>>     - 출력 형시을 제어 하기 위해서 -f 옵션을 사용 방법.

## 2.VMware
> VMware와 관련된 PowerCLI, PowerNSX, PowervRA 등을 관리.
>
>>### VMware/vSphere
>>> vCenter Server와 ESXi 관련된 PowerCLI Script 정리
>>> - Find-VMbyIP.ps1
>>>     - IP으로 VM 찾기
>>> - Get-VMOSBootTime.ps1
>>>     - VM이 부팅 후 지난 시간 확인.
>>> - Invoke-VMScriptWin.ps1
>>>     - Windows VM에 원격으로 Script 실행.(ex.GPUpdate /force를 원격으로 실행.)
>>> - New-VirtualStandardSwitch.ps1
>>>     - ESXi Host의 Virtual (Standard) Switch 생성.
>>> - Search-VMMACAddress.ps1
>>>     - MAC Address로 VM 찾기
>>> - Set-ESXiHostDNS.ps1
>>>     - ESXi Host의 DNS Server 설정
>>> - Set-ESXiHostNTP.ps1
>>>     - ESXi Host의 NTP Server 설정
>>> - Set-ESXiHostSSH.ps1
>>>     - ESXi Host의 SSH Service 자동 실행 설정
>>> - Set-ESXiPasswordPolicy.ps1
>>>     - ESXi Host의 Password 정책을 설정
>>### VMware/NSX-V
>>> NSX-V 관련된 PowerNSX Script 정리
>>>
>>### VMware/vRA
>>> vRA 관련된 PowervRA Script 정리

## 3.Windows
> Windows와 관련된 PowerShell 을 정리
>
>>### Domain Controller(AD, DNS, Etc)