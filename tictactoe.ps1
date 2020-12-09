#Init Array
$arrayA = " ", " ", " "
$arrayB = " ", " ", " "
$arrayC = " ", " ", " "

$index = "A", "B", "C"
$numeric = "1","2","3","4","5","6","7","8","9","0"
#Condition to keep game running
$gameEnd = 1
$playAgain = "E"
#Keep tracks of players
$player = 1
#Symbols for players
$symbol = "o", "x"

Function CreateGameBoard{
    #Creating/Updating Game Board
    Write-Host "`nTic-Tac-Toe :D"

    for($count = 0; $count -lt 3; $count++){
        Write-Host $arrayA[$count] -NoNewLine
        if($count -ne 2){
            Write-Host "|" -NoNewLine
            }
    }
    Write-Host ""

    for($count = 0; $count -lt 3; $count++){
        Write-Host $arrayB[$count] -NoNewLine
        if($count -ne 2){
            Write-Host "|" -NoNewLine
            }
    }
    Write-Host ""

    for($count = 0; $count -lt 3; $count++){
        Write-Host $arrayC[$count] -NoNewLine
        if($count -ne 2){
            Write-Host "|" -NoNewLine
            }
    }
    Write-Host "`n"
}

#Game instructions
Write-Host "To play: Row one has an index of A, Row two has an index of B, and Row three is C."
Write-Host "To select top left corner, please enter: A1. Middle Top: A2, Bottom Right: C3."


while($gameEnd -eq 1){

CreateGameBoard


#Get User Input
$userInput = Read-Host "Please enter your choice: "


#Assign input to new board
$changedX = $userInput.Substring(0,1)
$changedY = $userInput.Substring($userInput.length - 1)

#Validation on inputs
foreach($choice in $index){
    if($changedX -eq $choice){
        $validation1 = "Y"
        foreach($numbers in $numeric){
            if($changedY -eq $numbers){
                $validation2 = "Y"
            }
        }
    }
}

#Register moves
if($validation1 -eq "Y" -AND $validation2 -eq "Y"){
    switch($changedX){
    "A" {
        switch($changedY){
            1 {$arrayA[0] = $symbol[$player-1]}
            2 {$arrayA[1] = $symbol[$player-1]}
            3 {$arrayA[2] = $symbol[$player-1]}
            }               
        }                   
    "B" {                     
        switch($changedY){ 
            1 {$arrayB[0] = $symbol[$player-1]}
            2 {$arrayB[1] = $symbol[$player-1]}
            3 {$arrayB[2] = $symbol[$player-1]}
            }               
        }                   
    "C" {                     
        switch($changedY){  
            1 {$arrayC[0] = $symbol[$player-1]}
            2 {$arrayC[1] = $symbol[$player-1]}
            3 {$arrayC[2] = $symbol[$player-1]}
            }
        }
    }

    
    #Win Check
    if($arrayA[0] -eq $arrayA[1] -AND $arrayA[0] -eq $arrayA[2] -AND $arrayA[0] -ne " "){
        CreateGameBoard
        Write-Host "`nPlayer" $symbol[$player-1] "has won!"
        $playAgain = Read-Host "`nPlay again? (Y/N) . . ."
    }elseif($arrayB[0] -eq $arrayB[1] -AND $arrayB[0] -eq $arrayB[2] -AND $arrayB[0] -ne " "){
        CreateGameBoard
        Write-Host "`nPlayer" $symbol[$player-1] "has won!"
        $playAgain = Read-Host "`nPlay again? (Y/N) . . ."
    }elseif($arrayC[0] -eq $arrayC[1] -AND $arrayC[0] -eq $arrayC[2] -AND $arrayC[0] -ne " "){
        CreateGameBoard
        Write-Host "`nPlayer" $symbol[$player-1] "has won!"
        $playAgain = Read-Host "`nPlay again? (Y/N) . . ."
    }elseif($arrayA[0] -eq $arrayB[1] -AND $arrayA[0] -eq $arrayC[2] -AND $arrayA[0] -ne " "){
        CreateGameBoard
        Write-Host "`nPlayer" $symbol[$player-1] "has won!"
        $playAgain = Read-Host "`nPlay again? (Y/N) . . ."
    }elseif($arrayC[0] -eq $arrayB[1] -AND $arrayC[0] -eq $arrayA[2] -AND $arrayC[0] -ne " "){
        CreateGameBoard
        Write-Host "`nPlayer" $symbol[$player-1] "has won!"
        $playAgain = Read-Host "`nPlay again? (Y/N) . . ."
    }elseif($arrayA[0] -eq $arrayB[0] -AND $arrayA[0] -eq $arrayC[0] -AND $arrayA[0] -ne " "){
        CreateGameBoard
        Write-Host "`nPlayer" $symbol[$player-1] "has won!"
        $playAgain = Read-Host "`nPlay again? (Y/N) . . ."
    }elseif($arrayA[1] -eq $arrayB[1] -AND $arrayA[1] -eq $arrayC[1] -AND $arrayA[1] -ne " "){
        CreateGameBoard
        Write-Host "`nPlayer" $symbol[$player-1] "has won!"
        $playAgain = Read-Host "`nPlay again? (Y/N) . . ."
    }elseif($arrayA[2] -eq $arrayB[2] -AND $arrayA[2] -eq $arrayC[2] -AND $arrayA[2] -ne " "){
        CreateGameBoard
        Write-Host "`nPlayer" $symbol[$player-1] "has won!"
        $playAgain = Read-Host "`nPlay again? (Y/N) . . ."
    }

    #Switch Player
    if($player -eq 1){
       $player = 2
    }else {
        $player = 1
        }

    $validation1 = "N"
    $validation2 = "N"

}else{
    Write-Host "Please enter a valid input!"
}
    





#Reset Gameboard or exit when game is over
if($playAgain -eq "Y"){
    $arrayA = " ", " ", " "
    $arrayB = " ", " ", " "
    $arrayC = " ", " ", " "
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
