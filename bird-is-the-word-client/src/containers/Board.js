import React from 'react';
import Row from '../components/Row'
import { connect } from 'react-redux'

const Board = (props) => {
  const rows = props.board.map((row, index) => {
    return <Row row={row} x={index}/>
  })
  return(
    <table>
      {rows}
    </table>
  )
}

const mapStateToProps = (state) => {
  return({
    board: state.board
  })
}
export default connect(mapStateToProps)(Board);
