# Topo Loco Game
The Topo Loco Game in Bash

Execute the Script and start playing :)

### General Rules of the Game
1. It's a two player game
2. Each Game consists of 4 Rounds
3. Depending on the Dices rolled, you can pick adjudicate(Pick one) to the options available only once and that option cannot be adjucated again for each round
4. If it's a Topo Loco, Player automatically Wins.
5. If all 4 rounds pass without Topo Loco, Sum all of the scores, The one with the most points wins.

### Rules While Adjudicating
If you have already adjucated(picked) an option it will not be available again.

The Score is determined by the Following

| Options | Score | When available |
| ------- | ----- | -------------- |
| Topo Loco | Automatically Win | When all of the dices are the same e.g (1, 1, 1)
| Stairs  | Sum of the 3 dices     | When the next dice precedes the other order e.g (1, 2, 3) or (3, 1, 2) etc. |
| Jump    | Sum of the 3 dices     | When one of the dices summed by 2 equals another, e.g (**1**, **3**, 6) Jump 1 to 3 |
| Duque   | Sum of the repeated dices | When there are 2 dices with the same number e.g (**6**, **6**, 1) |
| 1       | Sum all of the dices with 1's | When one of the dices at least has a 1 e.g (**1**, 4, 5) |
| 2       | Sum all of the dices with 2's | When one of the dices at least has a 2 e.g (**2**, 5, 6) |
| 3       | Sum all of the dices with 3's | When one of the dices at least has a 3 e.g (5, **3**, 6) |
| 4       | Sum all of the dices with 4's | When one of the dices at least has a 4 e.g (1, **4**, 5) |
| 5       | Sum all of the dices with 5's | When one of the dices at least has a 5 e.g (**5**, 4, 6) |
| 6       | Sum all of the dices with 6's | When one of the dices at least has a 6 e.g (5, 3, **6**) |



 
