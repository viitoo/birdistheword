import React from 'react';
import Square from '../containers/Square'

const Row = (props) => {
  const squares = props.row.map((square, index)=> {
    return <Square square={square} x={props.x} y={index} key={index} tiles={props.tiles}/>
  })
  return(
    <tr>
      {squares}
    </tr>
  )
}


export default Row;