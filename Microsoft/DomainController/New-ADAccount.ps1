## 2017-01-08 김성환 만듦.
## -PasswordNeverExpires $True
## 암호 만기 설정 안 함 
## -ChangePasswordAtLogon $False -AccountPassword
## 첫 로그인 시 암호 변경 안 함
## -AccountPassword (ConvertTo-SecureString "Password1!" -AsPlainText -Force) -Enabled $true }
## Password1! 으로 암호 설정 함.

$CSVPath = "C:\PowerShell\Microsoft\DomainController\New-ADAccount.csv"    # 계정 목록 파일 경로 (중요. 한글이 있는 경우 반드시 UTF-8 형식으로 저장)

Import-Csv $CSVPath | ForEach-Object {
    New-aduser -Name $_.name -Surname $_.Surname -givenName $_.givenName -Path $_.Path -samaccount $_.SamaccountName -userPrincipalName $_.userPrincipalName -DisplayName $_.DisplayName -description $_.description -PasswordNeverExpires $True -ChangePasswordAtLogon $False -AccountPassword (ConvertTo-SecureString "VMware1!" -AsPlainText -Force) -Enabled $true
    Add-ADGroupMember -Identity $_.ADGroup -Members $_.SamaccountName;
} 
