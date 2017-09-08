import React, {Component} from 'react';
import Row from '../components/Row'
import { connect } from 'react-redux'


class Board extends Component{

  render(){
    
    const rows = this.props.board.map((row, index) => {
      return <Row row={row} x={index} key={index}/>
      }
    ) 
    return(
      <table>
        <tbody>
          {rows}
        </tbody>
      </table>
  )
  }
  
}

export default Board;
