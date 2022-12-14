Using Namespace System.Collections.Generic
<#
    Rock beats Scissors 
    Scissors beats Paper
    Paper defeats rock
    Both select same, draw

    Elf give sencrypted strategy guide (input)
    Column 1 is what opponent os going to play,
    Column 2 is what you are going to paly

    A = ROCK
    B = PAPER
    C = Scissors

    X = Rock
    Y = Paper
    Z = Scissors

    A/X beats C/Z
    B/Y beats A/X
    C/Z beats B/Y
    D == D (DRAW)
    
    A beats Z
    B beats X
    C beats Y
    match = draw

#>

$stopwatch =  [system.diagnostics.stopwatch]::StartNew()
$rockPaperScissorsGuide = [Dictionary[String,Int32]]::new()
$rockPaperScissorsGuide.Add('A X', 4)
$rockPaperScissorsGuide.Add('A Y', 8)
$rockPaperScissorsGuide.Add('A Z', 3)
$rockPaperScissorsGuide.Add('B X', 1)
$rockPaperScissorsGuide.Add('B Y', 5)
$rockPaperScissorsGuide.Add('B Z', 9)
$rockPaperScissorsGuide.Add('C X', 7)
$rockPaperScissorsGuide.Add('C Y', 2)
$rockPaperScissorsGuide.Add('C Z', 6)


$me = 0

$gameData = Get-Content -Path 'F:\Advent\2\RockPaperScissorsInput.csv'
For ( $hand = 0; $hand -lt $gameData.Count; $hand ++ ) {
    $me += $rockPaperScissorsGuide[ "$($gameData[ $hand ])" ]
}
$stopwatch.Stop()
$stopwatch
$me