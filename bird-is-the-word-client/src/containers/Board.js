import React from 'react';
import Row from '../components/Row'

const Board = (props) => {
  const rows = props.board.full_board.map((row, index) => {
    return <Row row={row} x={index}/>
  })
  return(
    <table>
      {rows}
    </table>
  )
}
export default Board;
