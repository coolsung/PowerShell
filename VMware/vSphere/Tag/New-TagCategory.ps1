
$TagCategoryName = "Veeam_Backup"
$TagCategoryCardinality = "Single"      ## Single or Multiple
$TagCategoryDescription = "Veeam Backup Schedule"


New-TagCategory -Name $TagCategoryName -Cardinality $TagCategoryCardinality -Description $TagCategoryDescription