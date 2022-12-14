Using Namespace System.Collections.Generic
<#
    Reindeer need a lot of magical energy
        Favorite snack is a special type of star fruit that grows in jungle
    Need at least 50 stars by 12/25
    Each puzzle grants +1 star
#>

<#
    Calories (puzzle input)
#>
# Dict of String (key), value of List of Int32Array
$raw = Get-Content -Path .\CalorieCountingInput.txt -Raw
# for some reason \n\n was being weird
$newLine = [System.Environment]::NewLine
# this should create the break char from bytes
$elfSets = ($raw -split "$newLine$newLine")

$elfInventory = [Dictionary[String,PSCustomObject]]::new()

$mostCalories = [PSCustomObject] @{
    Elf = $null
    CalorieInventoryTotal = 0
}

For( $set = 0; $set -lt $elfSets.Count; $set++ ) {
    [Int32[]] $tempSet = $elfSets[ $set ].Split($newLine)
    $tempObject = [PSCustomObject]@{
        CalorieInventory = $tempSet
        CalorieInventoryTotal = ( $tempSet | Measure-Object -Sum).Sum
    }
    $elfInventory.Add( ("Elf" + "$($set)"), $tempObject )
    If ($tempObject.CalorieInventoryTotal -gt $mostCalories.CalorieInventoryTotal) {
        $mostCalories.Elf = ("Elf" + "$($set)")
        $mostCalories.CalorieInventoryTotal = $tempObject.CalorieInventoryTotal
        }
}
$mostCalories
<#
    Elf    CalorieInventoryTotal
    ---    ---------------------
    Elf126              66487.00
#>
