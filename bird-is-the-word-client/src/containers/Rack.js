import React from 'react';
import Tile from '../components/Tile'



const Rack = (props) => {
 
  const rack = props.rack.map(id =>{

    const tile_id = parseInt(id)

    function findTile(tile){
      return tile.id === tile_id
    }
    var tile = props.tiles.find(findTile);
      return <Tile x={tile.x} y={tile.y} letter = {tile.letter} id={tile.id} points={tile.points} />
  })
  
    

  return(
    <div>
     {rack}
    </div>
  )  
 
}

export default Rack;