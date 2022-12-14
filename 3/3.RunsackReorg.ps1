Using Namespace System.Collections.Generic
<#
    Two large compartments
    List of items currently in eeach runsack
        case sensitive
    Always has even number of items in each of it's two compartments
#>
$lowerInt = 1
$priority = [Dictionary[Char,Int]]::New()
97..122 | ForEach-Object{ $priority.Add( [Char] $_, $lowerInt ) ; $lowerInt ++ }
$upperInt = 27
65..90 | ForEach-Object{ $priority.Add( [Char] $_, $upperInt ) ; $upperInt ++}
$dupe = [List[Char]]::New()
$runsacks = Get-Content -Path 'F:\Advent\3\RunsackInput.txt'
For ($runsack = 0; $runsack -lt $runsacks.Count; $runsack ++) {
    $compartments = @{
        Compartment1 = [Char[]] $runsacks[ $runsack ].SubString( 0, ( $runsacks[ $runsack ].Length / 2 ) )
        Compartment2 = [Char[]] $runsacks[ $runsack ].SubString($runsacks[ $runsack ].Length - ( $runsacks[ $runsack ].Length / 2 ) )
    }
    For ($charCount = 0; $charCount -lt $compartments['Compartment1'].Length; $charCount ++) {
        If ( $compartments['Compartment1'] -ccontains $compartments['Compartment2'][ $charCount ]  ) {
            $dupe.Add( $compartments['Compartment2'][ $charCount ] )
        }
    }
}

( $dupe | ForEach-Object { $priority["$($_)"] } ) | Measure-Object -Sum