## https://ss64.com/ps/syntax-f-operator.html
## https://ss64.com/ps/syntax-dateformats.html


Write-host Result: 123.457  -ForegroundColor Green
"{0:n3}" -f 123.45678


Write-host `n`nRight align the first number only: -ForegroundColor Green
Write-host "|         4" -ForegroundColor Green
"{0,10}" -f 4,5,6


Write-host `n`nLeft and right align text: -ForegroundColor Green
Write-host "|hello     ||     world|" -ForegroundColor Green
"|{0,-10}| |{1,10}|" -f "hello", "world"


Write-host `n`nDisplay an integer with 3 digits: -ForegroundColor Green
Write-host 012 -ForegroundColor Green
"{0:n3}" -f [int32]12


Write-host `n`n"Separate a number with dashes (# digit place holder):" -ForegroundColor Green
Write-host 123-45-67 -ForegroundColor Green
"{0:###-##-##}" -f 1234567


Write-host "`n`nCreate a list of 100 names with a padded suffix no. (Name001 → Name010):" -ForegroundColor Green
1..10 | ForEach-Object { 'Name{0:d3}' -f $_ }

Write-host `n`nConvert a number to Hex: -ForegroundColor Green
Write-host Second     First        FF -ForegroundColor Green
"{1,10} {0,10} {2,10:x}" -f "First", "Second", 255


Write-host `n`nDisplay filenames and creation time: -ForegroundColor Green
Get-ChildItem C:\Users | ForEach-Object {'Filename: {0} Created: {1}' -f $_.fullname,$_.creationtime}

Write-host `n`nDisplay only the Year from a date time value: -ForegroundColor Green
Write-host 2018 -ForegroundColor Green
"{0:yyyy}" -f (Get-Date)


Write-host `n`nDisplay the hours and minutes from a date time value: -ForegroundColor Green
Write-host 17:52 -ForegroundColor Green
"{0:hh}:{0:mm}" -f (Get-Date)


Write-host `n`nReverse the order of display: -ForegroundColor Green
Write-host hello world 3.142 -ForegroundColor Green
"{2} {1,-10} {0:n3}" -f [math]::pi, "world", "hello"


Write-host `n`nDisplay a number as a percentage: -ForegroundColor Green
Write-host 50% -ForegroundColor Green
"{0:p0}" -f 0.5


Write-host `n`nDisplay a whole number padded to 5 digits: -ForegroundColor Green
Write-host 00123 -ForegroundColor Green
"{0:d5}" -f 123
