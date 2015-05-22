# Prints the Dices
function printDice {
    echo "-----      -----     ----- "
    echo "| $1 |      | $2 |     | $3 |" 
    echo "-----      -----     ----- "
}

# Sorts the Dices in order
function diceSort {
    arr=($1 $2 $3)
    for i in ${arr[*]}; do
        echo $i
    done | sort -n
}

# Determines if it's a Topo Loco
function isTopoLoco {
    if [[ $1 -eq $2 && $2 -eq $3 ]]; then
      	return 1
    fi
}

# Determines if it's a Stair
function isStairs {
    read -a sortedDices <<< $(diceSort $1 $2 $3) 
    fNum=${sortedDices[0]}+1
    sNum=${sortedDices[1]}+1
    if [[ $fNum -eq ${sortedDices[1]} && $sNum -eq ${sortedDices[2]} ]]; then
		echo "It's Stairs"
		return 1
    fi    
}

# Determines if it's a Jump
function isJump {
    read -a sortedDices <<< $(diceSort $1 $2 $3)
    fNum=${sortedDices[0]}+2
    sNum=${sortedDices[1]}+2
    if [[ $fNum -eq ${sortedDices[2]} || $fNum -eq ${sortedDices[1]} || $sNum -eq ${sortedDices[2]} ]]; then
        echo "Its Jump"
		return 1
    fi
}

# Determines if it's a Duque
function isDuque {
    if [[ $1 -eq $2 || $1 -eq $3 || $2 -eq $3 ]]; then
        echo "It's Duque"
		return 1
    fi 
}

# Shows the options available to adjucate
function optionsForAdjudication {
    adjucated=("${!4}") 
    echo "Here are the options for adjucation available:"
    # If is Stairs and is not Adjudicated
    if [[ $5 -eq 1 && ${adjucated[0]} -eq 0 ]]; then
		echo "1. Stairs"
    fi
    # If is Jump and is not Adjudicated
    if [[ $6 -eq 1 && ${adjucated[1]} -eq 0 ]]; then
   		echo "2. Jump"
    fi
    # If is Duque and is not Adjudicated
    if [[ $7 -eq 1 && ${adjucated[2]} -eq 0 ]]; then
		echo "3. Duque"
    fi
    # If one of the dices contains a 1 and is not Adjucated
    if [[ ($1 -eq 1 || $2 -eq 1 || $3 -eq 1) && ${adjucated[3]} -eq 0 ]]; then
		echo "4. 1"
    fi
    # If one of the dices contains a 2 and is not adjucated
    if [[ ($1 -eq 2 || $2 -eq 2 || $3 -eq 2) && ${adjucated[4]} -eq 0 ]]; then
		echo "5. 2"
    fi
    # If one of the dices contains a 3 and is not Adjucated
    if [[ ($1 -eq 3 || $2 -eq 3 || $3 -eq 3) && ${adjucated[5]} -eq 0 ]]; then
  		echo "6. 3"
    fi
    # If one of the dices contains a 4 and is not Adjucated
    if [[ ($1 -eq 4 || $2 -eq 4 || $3 -eq 4) && ${adjucated[6]} -eq 0 ]]; then
		echo "7. 4"
    fi
    # If one of the dices contains a 5 and is not Adjucated
    if [[ ($1 -eq 5 || $2 -eq 5 || $3 -eq 5) && ${adjucated[7]} -eq 0 ]]; then
		echo "8. 5"
    fi
    # If one of the dices contains a 6 and is not Adjucated
    if [[ ($1 -eq 6 || $2 -eq 6 || $3 -eq 6) && ${adjucated[8]} -eq 0 ]]; then
		echo "9. 6"
    fi 
    	echo "0. None"
}
# Reads Player Input to Adjudicate to the Score.
function adjudicate {
    declare -a adjucated=("${!4}")
    success=0
    while [[ $success -eq 0 ]]; do
		echo "Enter your Selection: "
    	read playerPicked
		if [[ $playerPicked -eq 1 ]]; then
			# If [[ isStairs ]] && is not adjucated;
			if [[ $5 -eq 1 && ${adjucated[0]} -eq 0 ]]; then
				adjucated[0]=$(($1+$2+$3))
				success=1
			else
				echo "Sorry, You cannot adjudicate to Stairs"
	    	fi
		fi
	    if [[ $playerPicked -eq 2 ]]; then
			# If [[ isJump ]] && is not adjucated
			if [[ $6 -eq 1 && ${adjucated[1]} -eq 0 ]]; then
				adjucated[1]=$(($1+$2+$3))
				success=1
			else
				echo "Sorry, you cannot adjudicate to Jump"
	    	fi
		fi
		if [[ $playerPicked -eq 3 ]]; then
			# If [[ isDuque ]] && is not adjucated
	    	if [[ $7 -eq 1 && ${adjucated[2]} -eq 0 ]]; then
				if [[ $1 -eq $2 ]]; then
					adjucated[2]=$(($1+$2))
				elif [[ $1 -eq $3 ]]; then
					adjucated[2]=$(($1+$3))
				elif [[ $2 -eq $3 ]]; then
					adjucated[2]=$(($2+$3))
				fi
				success=1
			else
				echo "Sorry, you can't adjudicate to Duque"
	    	fi
		fi
		if [[ $playerPicked -eq 4 ]]; then
			# If one of the dices contains a 1 adjudicate to 1
	    	if [[ ($1 -eq 1 || $2 -eq 1 || $3 -eq 1) && ${adjucated[3]} -eq 0 ]]; then
				if [[ $1 -eq 1 && $2 -eq 1 ]]; then
					adjucated[3]=$(($1+$2))
				elif [[ $1 -eq 1 && $3 -eq 1 ]]; then
					adjucated[3]=$(($1+$3))
				elif [[ $2 -eq 1 && $3 -eq 1 ]]; then
					adjucated[3]=$(($2+$3))
				else
					adjucated[3]=1
				fi
				success=1
			else
				echo "Sorry you can't adjudicate to 1"
	    	fi
		fi
		if [[ $playerPicked -eq 5 ]]; then
			# If one of the dices contains a 2 adjudicate to 2
	    	if [[ ($1 -eq 2 || $2 -eq 2 || $3 -eq 2) && ${adjucated[4]} -eq 0 ]]; then
				if [[ $1 -eq 2 && $2 -eq 2 ]]; then
					adjucated[4]=$(($1+$2))
				elif [[ $1 -eq 2 && $3 -eq 2 ]]; then
					adjucated[4]=$(($1+$3))
				elif [[ $2 -eq 2 && $3 -eq 2 ]]; then
					adjucated[4]=$(($2+$3))
				else
					adjucated[4]=2
				fi
				success=1
			else
				echo "Sorry you can't adjudicate to 2"
			fi
		fi
		if [[ $playerPicked -eq 6 ]]; then
			# If one of the dices contains 3 adjudicate to 3
	    	if [[ ($1 -eq 3 || $2 -eq 3 || $3 -eq 3) && ${adjucated[5]} -eq 0 ]]; then
				if [[ $1 -eq 3 && $2 -eq 3 ]]; then
					adjucated[5]=$(($1+$2))
				elif [[ $1 -eq 3 && $3 -eq 3 ]]; then
					adjucated[5]=$(($1+$3))
				elif [[ $2 -eq 3 && $3 -eq 3 ]]; then
					adjucated[5]=$(($2+$3))
				else
					adjucated[5]=3
				fi
		    	success=1
			else
				echo "Sorry you can't adjudicate to 3"
	    	fi
		fi
		if [[ $playerPicked -eq 7 ]]; then
			# If one of the dices contains 4 adjudicate to 4.
	    	if [[ ($1 -eq 4 || $2 -eq 4 || $3 -eq 4) && ${adjucated[6]} -eq 0 ]]; then
				if [[ $1 -eq 4 && $2 -eq 4 ]]; then
					adjucated[6]=$(($1+$2))
				elif [[ $1 -eq 4 && $3 -eq 4 ]]; then
					adjucated[6]=$(($1+$3))
				elif [[ $2 -eq 4 && $3 -eq 4 ]]; then
					adjucated[6]=$(($2+$3))
				else
					adjucated[6]=4
				fi
				success=1
			else
				echo "Sorry you can't adjudicate to 4"
			fi
		fi
		if [[ $playerPicked -eq 8 ]]; then
			# If one of the dices contains 5 adjudicate to 5
	    	if [[ ($1 -eq 5 || $2 -eq 5 || $3 -eq 5) && ${adjucated[7]} -eq 0 ]]; then
				if [[ $1 -eq 5 && $2 -eq 5 ]]; then
					adjucated[7]=$(($1+$2))
				elif [[ $1 -eq 5 && $3 -eq 5 ]]; then
					adjucated[7]=$(($1+$3))
				elif [[ $2 -eq 5 && $3 -eq 5 ]]; then
					adjucated[7]=$(($2+$3))
				else
					adjucated[7]=5
				fi
				success=1
			else
				echo "Sorry you can't adjudicate to 5"
			fi
		fi
		if [[ $playerPicked -eq 9 ]]; then
			# If one of the dices contains 6 adjudicate to 6.
	    	if [[ ($1 -eq 6 || $2 -eq 6 || $3 -eq 6) && ${adjucated[8]} -eq 0 ]]; then
				if [[ $1 -eq 6 && $2 -eq 6 ]]; then
					adjucated[8]=$(($1+$2))
				elif [[ $1 -eq 6 && $3 -eq 6 ]]; then
					adjucated[8]=$(($1+$3))
				elif [[ $2 -eq 6 && $3 -eq 6 ]]; then
					adjucated[8]=$(($2+$3))
				else
					adjucated[8]=6
				fi
				success=1
			else
				echo "Sorry you can't adjudicate to 6"
			fi
		fi
		if [[ $playerPicked -eq 0 ]]; then
			success=1
		fi
    done
    
    # Updates ScoreBoard for either player 1 or player 2
    if [[ $8 -eq 1 ]]; then
        for y in ${!adjucated[@]}; do
	    	adjucationP1[$y]=${adjucated[$y]}
		done
    else
        for z in ${!adjucated[@]}; do
	    	adjucationP2[$z]=${adjucated[$z]}
        done
    fi
}

# Calculates all the points of the Array for the player
function calculateScore {
    local adjucation=("${!1}")
    local score=0
    for x in ${adjucation[@]}; do
		score=$(($x + $score))
    done
    return $score
}

# Outputs the Winner by score
function determineWinner {
    echo "$1 score: $2"
    echo "$3 score: $4"
    echo "" 
    if [[ $2 -eq $4 ]]; then
		echo "This match has ended in a draw"
    elif [[ $2 > $4 ]]; then
		echo "$1 has won the match!"
    else
		echo "$3 has won the match"
    fi
}

# Main Game
function playGame {
    echo "$1 throws the dices"
    dice1=$(($RANDOM%6+1))
    dice2=$(($RANDOM%6+1))
    dice3=$(($RANDOM%6+1))
    printDice $dice1 $dice2 $dice3
    isTopoLoco $dice1 $dice2 $dice3 
    won=$?
    if [[ $won -eq 1 ]]; then
		echo "$1 Has won with Topo Loco!"
        echo "Thank you for playing in my Topo Loco World"
		exit 1
    fi
    isStairs $dice1 $dice2 $dice3
    stairs=$? # 0 = false | 1 = True
    isJump $dice1 $dice2 $dice3
    jump=$? # 0 = false | 1 = True
    isDuque $dice1 $dice2 $dice3
    duque=$? # 0 = false | 1 = True
    declare -a playerAdjucated=("${!2}")
    optionsForAdjudication $dice1 $dice2 $dice3 playerAdjucated[@] $stairs $jump $duque
    adjudicate $dice1 $dice2 $dice3 playerAdjucated[@] $stairs $jump $duque $3
}

# Initializes all of the array with 0's
function initArray {
    for ((a=0; a<=8; a++)); do
		adjucationP1[$a]=0
        adjucationP2[$a]=0
    done
}

## Program Starts From here.
echo "Welcome to the Topo Loco World"

# Retrieves from player Input their names
echo "Write player 1's name: "
read player1
echo "Write player 2's name: "
read player2

# Shows the player's names
echo "Player 1: $player1"
echo "Player 2: $player2"

# Initialize Global Array Variable
declare -a adjucationP1=()
declare -a adjucationP2=()
initArray

# Main Loop of Game
for ((c=1; c<=4; c++)) ; do 
    printf "\n"
    echo "Round $c"
    playGame "$player1" adjucationP1[@] 1
    echo "Player 1 Score: ${adjucationP1[@]}"
    echo ""
    playGame "$player2" adjucationP2[@] 2
    echo "Player 2 Score: ${adjucationP2[@]}"
    echo ""
done

calculateScore adjucationP1[@]
scoreP1=$?
calculateScore adjucationP2[@]
scoreP2=$?

determineWinner "$player1" $scoreP1 "$player2" $scoreP2
echo "Thank you for playing in my Topo Loco World!"