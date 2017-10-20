import React from 'react';


const GameLog = (props) => {
  var gameLog = ""
  if (props.player_1 !== null && props.player_2 !== null && props.player_2.turns.length > 0){

  const gameTurns = props.player_1.turns.map(function(turn, index) { 
    if (props.player_2.turns[index]){
      return [turn, props.player_2.turns[index]]
    }else{
      return[turn]
    }
    
    }).reduce(function(a,b) { return a.concat(b); })
   console.log(gameTurns)
   gameLog = gameTurns.map((turn, index) => {
      if (index % 2 === 0 && props.player_2.turns.length > 0){
        return(<p>{props.player_1.username + " played " + turn.played_word + " for " + turn.points + " points"}</p>)
      } else {
        return(<p>{props.player_2.username + " played " + turn.played_word + " for " + turn.points + " points"}</p>)
       }
      })

  } else if (props.player_1 !== null && props.player_1.turns.length > 0){
    gameLog = <p>{props.player_1.username + " played " + props.player_1.turns[0].played_word + " for " + props.player_1.turns[0].points + " points"}</p>
  }
  
    
   return(
    <div>
      <h1></h1>
      {gameLog}
    </div>
  )
}
export default GameLog;


