
$VMname = "T_W2019StdEn_20200209"
$ExportFilePath = "D:\Temp\"
$FormatType = "OVF"


Export-VApp  -VM $VMname -Format $FormatType -Destination $ExportFilePath