import React, {Component} from 'react';
import Row from '../components/Row'
import { connect } from 'react-redux'
import { getBoard } from '../actions/board'

class Board extends Component{
  //Here will be an API call to get the BOARD
  componentDidMount(){
      this.props.getBoard()
  }

  render(){
    const rows = this.props.board.map((row, index) => {
      return <Row row={row} x={index} key={index}/>
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
export default connect(mapStateToProps, { getBoard })(Board);
