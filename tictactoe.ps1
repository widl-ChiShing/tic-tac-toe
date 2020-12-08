#Init Array
$array1 = " ", " ", " "
$array2 = " ", " ", " "
$array3 = " ", " ", " "

$numeric = "1","2","3","4","5","6","7","8","9","0"
#Condition to keep game running
$gameEnd = 1
$playAgain = "E"
#Keep tracks of players
$player = 1
#Symbols for players
$symbol = "x", "o"

Function CreateGameBoard{
    #Creating/Updating Game Board
    Write-Host "`nTic-Tac-Toe :D`n"

    for($count = 0; $count -lt 3; $count++){
        Write-Host $array1[$count] -NoNewLine
        if($count -ne 2){
            Write-Host "|" -NoNewLine
            }
    }
    Write-Host ""

    for($count = 0; $count -lt 3; $count++){
        Write-Host $array2[$count] -NoNewLine
        if($count -ne 2){
            Write-Host "|" -NoNewLine
            }
    }
    Write-Host ""

    for($count = 0; $count -lt 3; $count++){
        Write-Host $array3[$count] -NoNewLine
        if($count -ne 2){
            Write-Host "|" -NoNewLine
            }
    }
    Write-Host "`n"
}

#Game instructions
Write-Host "To play: Enter the indexes of the slot.`ni.e. For the middle box, enter: 2,2. "
Write-Host "For top left corner, enter: 1,1. For top right corner, enter: 1,3."


while($gameEnd -eq 1){

CreateGameBoard


#Get User Input
$userInput = Read-Host "Please enter your choice: "
foreach($numbers in $numeric){
    if($userInput[0] -eq $numbers){
        $validation1 = "Y"
    }
    if($userInput[2] -eq $numbers){
        $validation2 = "Y"
    }
}

#Assign input to new board
$changedX = $userInput.Substring(0,1)
$changedY = $userInput.Substring($userInput.length - 1)

while($validation1 -eq "Y" -AND $validation2 -eq "Y"){
    switch($changedX){
    1 {
        switch($changedY){
            1 {$array1[0] = $symbol[$player-1]}
            2 {$array1[1] = $symbol[$player-1]}
            3 {$array1[2] = $symbol[$player-1]}
            }               
        }                   
    2 {                     
        switch($changedY){ 
            1 {$array2[0] = $symbol[$player-1]}
            2 {$array2[1] = $symbol[$player-1]}
            3 {$array2[2] = $symbol[$player-1]}
            }               
        }                   
    3 {                     
        switch($changedY){  
            1 {$array3[0] = $symbol[$player-1]}
            2 {$array3[1] = $symbol[$player-1]}
            3 {$array3[2] = $symbol[$player-1]}
            }
        }
    }
    $validation1 = "N"
    $validation2 = "N"
}
    




#Win Check
if($array1[0] -eq $array1[1] -AND $array1[0] -eq $array1[2] -AND $array1[0] -ne " "){
    CreateGameBoard
    Write-Host "`nPlayer" $player "has won!"
    $playAgain = Read-Host "`nPlay again? (Y/N) . . ."
}elseif($array2[0] -eq $array2[1] -AND $array2[0] -eq $array2[2] -AND $array2[0] -ne " "){
    CreateGameBoard
    Write-Host "`nPlayer" $player "has won!"
    $playAgain = Read-Host "`nPlay again? (Y/N) . . ."
}elseif($array3[0] -eq $array3[1] -AND $array3[0] -eq $array3[2] -AND $array3[0] -ne " "){
    CreateGameBoard
    Write-Host "`nPlayer" $player "has won!"
    $playAgain = Read-Host "`nPlay again? (Y/N) . . ."
}elseif($array1[0] -eq $array2[1] -AND $array1[0] -eq $array3[2] -AND $array1[0] -ne " "){
    CreateGameBoard
    Write-Host "`nPlayer" $player "has won!"
    $playAgain = Read-Host "`nPlay again? (Y/N) . . ."
}elseif($array3[0] -eq $array2[1] -AND $array3[0] -eq $array1[2] -AND $array3[0] -ne " "){
    CreateGameBoard
    Write-Host "`nPlayer" $player "has won!"
    $playAgain = Read-Host "`nPlay again? (Y/N) . . ."
}elseif($array1[0] -eq $array2[0] -AND $array1[0] -eq $array3[0] -AND $array1[0] -ne " "){
    CreateGameBoard
    Write-Host "`nPlayer" $player "has won!"
    $playAgain = Read-Host "`nPlay again? (Y/N) . . ."
}elseif($array1[1] -eq $array2[1] -AND $array1[1] -eq $array3[1] -AND $array1[1] -ne " "){
    CreateGameBoard
    Write-Host "`nPlayer" $player "has won!"
    $playAgain = Read-Host "`nPlay again? (Y/N) . . ."
}elseif($array1[2] -eq $array2[2] -AND $array1[2] -eq $array3[2] -AND $array1[2] -ne " "){
    CreateGameBoard
    Write-Host "`nPlayer" $player "has won!"
    $playAgain = Read-Host "`nPlay again? (Y/N) . . ."
}#Switch Player
elseif($player -eq 1){
       $player = 2
    }else {
        $player = 1
        }

if($playAgain -eq "Y"){
    $array1 = " ", " ", " "
    $array2 = " ", " ", " "
    $array3 = " ", " ", " "
    $playAgain = "E"
}elseif($playAgain -eq "N"){
    $gameEnd = 2
}elseif($playAgain -eq "E"){
}else{
    Wrist-Host "Please enter a valid answer."
    $playAgain = Read-Host "`nPlay again? (Y/N) . . ."
}
#End While Loop
}

Read-Host "Thanks for playing! Press enter to exit..."