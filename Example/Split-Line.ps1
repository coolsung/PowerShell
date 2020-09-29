

$List = {
    acb
    cacls.exed
    sff
    sfdf



}

$Split_List = $List -split "\n" #Seprating Line

Foreach ($aLine in $Split_List){

    $aLine = $aLine -replace '\s' #Removing Space

    If([string]::IsNullOrEmpty($aLine)){
        
        Write-Host ==================
    }else {
        
        Write-Host Run $aLine
    }


}