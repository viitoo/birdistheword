import React from 'react';
import Tile from '../components/Tile'
import Square from '../components/Square'



const Rack = (props) => {
  const rack = props.rack.map((id, index)=>{

    const tile_id = parseInt(id)

    function findTile(tile){
      return tile.id === tile_id
    }
    var tile = props.tiles.find(findTile);
    

      return <Square square={{"color": "white"}} x={1} y={index+100} />
  })
  
    

  return(
    <div>
      Your tiles
     {rack}
    </div>
  )  
 
}

export default Rack;