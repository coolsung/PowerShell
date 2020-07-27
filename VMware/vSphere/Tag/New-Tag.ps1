
$TagFilePath = "New-Tag.csv"

Import-Csv $TagFilePath | ForEach-Object {
    Write-Host Creating Tag Name = $_.TagName / Catalog = $_.TagCategory / Descripton = $_.TagDescription -ForegroundColor Green


    New-Tag –Name $_.TagName –Category $_.TagCategory -Description $_.TagDescription
}