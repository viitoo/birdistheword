import React, {Component} from 'react';
import Row from '../components/Row'
import { connect } from 'react-redux'

class Board extends Component{
  render(){
    const rows = this.props.board.map((row, index) => {
      return <Row row={row} x={index}/>
      }
    ) 

 
    return(
      <table>
      {rows}
      </table>
  )
  }
  
}

const mapStateToProps = (state) => {
  return({
    board: state.board
  })
}
export default connect(mapStateToProps)(Board);
