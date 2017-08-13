import React from 'react';
import Row from '../components/Row'

const Board = (props) => {
  const rows = props.board.full_board.map(row => {
    return <Row row={row}/>
  })
  return(
    <table>
      {rows}
    </table>
  )
}
export default Board;
