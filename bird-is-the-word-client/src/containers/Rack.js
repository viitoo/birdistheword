import React from 'react';
import Square from '../components/Square'



const Rack = (props) => {
  const rack = props.rack.map((id, index)=>{

    // const tile_id = parseInt(id, 10)

    // function findTile(tile){
    //   return tile.id === tile_id
    // }
    // var tile = props.tiles.find(findTile);
      return <Square square={{"color": "white"}} x={1} y={index+100} key={index} />
  })
  
    

  return(
    <div>
      <p>Your rack</p>
      <table>
        <tbody>
          <tr>
            {rack}  
          </tr>
        </tbody>
      </table>
    </div>
    
  )  
 
}

export default Rack;