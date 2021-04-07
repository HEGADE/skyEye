# powerShell script for finding Hidden directories
$userPath = $Home
$currentDor = pwd
Write-Host("1 For documets")
Write-Host("2 Entire system")
Write-Host("3 Custom path")
$choice = Read-Host("Enetr your choice")
function searchingIndocs {
    $docs = "\documents"
    $docf = $userPath + $docs
    Set-Location  $docf
   Get-ChildItem   -recurse -Hidden |  ForEach-Object  {$_.name}
    

}
function searchAll {
   
    
    Set-Location "c:\"
    Get-ChildItem  -recurse -Hidden |  ForEach-Object  {$_.name}
  

}
function settingLoc {
    param (
        $loc
    )
    Set-Location $loc
    Get-ChildItem  -recurse -Hidden |  ForEach-Object  {$_.name}
}
function searchCustom {
    param (
        $custom
    )
    if (Test-path $custom) {
        Write-Host("Searching in " +$custom)
        Set-Location $custom
        $count1=Get-ChildItem  -recurse -Hidden
        if(  $count1.Count -eq 0){
            Write-Host("No Hidden files Found")
        }
        else{

            Get-ChildItem  -recurse -Hidden |  ForEach-Object  {$_.name}
        }
    }
    else {
        Write-Host("Path  Does not exits")
    }

}
switch ($choice) {
    1 {
         


        searchingIndocs
        settingLoc($currentDor)
    }
    2 {
        


        searchAll
        settingLoc($currentDor)
    }
    3{
  
        $customPath = Read-Host("Enetr the custom path")


        searchCustom($customPath)
        settingLoc($currentDor)
    }
    default {
        Write-Host("Enter the right choice")
    }
    
}


