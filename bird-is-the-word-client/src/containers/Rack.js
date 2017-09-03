import React from 'react';
import Tile from '../components/Tile'

const Rack = (props) => {
  
  const rack = props.players.players[0].rack.map(letter => {
    return <Tile letter={letter} />
    }
  )
  const bag = props.bag.map((tile, index) => {
      return <Tile letter={tile.letter} x={tile.x} y={tile.y} id={index}/>
    }
  )
  return(
    <div>
      {bag}
    </div>
  )
  
}

export default Rack;