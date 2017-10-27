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
  
  if (rack.length < 7){
    var number_of_squares = 7 - rack.length
    for (var i = 0; i < number_of_squares; i++) { 
      rack.push(<Square square={{"color": "white"}} x={1} y={(7-i)+100} />)
    }
  }

  return(
    <div>
      <table className="display-inline">
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