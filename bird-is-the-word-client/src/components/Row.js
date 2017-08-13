import React from 'react';
import Square from './Square'

const Row = (props) => {
  const squares = props.row.map(square => {
    return <Square square={square}/>
  })
  return(
    <tr>
      {squares}
    </tr>
  )
}


export default Row;