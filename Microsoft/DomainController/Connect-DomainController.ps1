Import-Module ActiveDirectory
New-PSDrive -Name cnd -PSProvider ActiveDirectory -Server "hq-dc01.cnd.lab" -Scope Global -root "//RootDSE/"
Set-Location cnd: