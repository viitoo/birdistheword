import React from 'react';
import Tile from '../components/Tile'

const Rack = (props) => {
  
  const rack = props.players.players[0].rack.map(letter => {
    return <Tile letter={letter} />
    }
  )
  return(
    <div>
      <h1>{props.players.players[0].name}</h1>
      <table>
        {rack}
      </table>
    </div>
  )
  
}

export default Rack;