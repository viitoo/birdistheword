import React, {Component} from 'react';
import { ItemTypes } from '../Constants'
import { DropTarget } from 'react-dnd'
import { dropTile } from '../actions/board'
import { compose } from 'redux'
import { connect } from 'react-redux'
import Tile from './Tile'

const squareTarget = {
  drop(props, monitor){
    const letter = monitor.getItem().tileValue
    // props.dropTile(props.x, props.y, letter)

    //When .didDrop() === true
    //send tile id, new position
    //send tile position to the state, when rendering square inside row check all tiles for same position and render the one that has the correct position on top of the square
  }
}

function collect(connect, monitor){
  return {
    connectDropTarget: connect.dropTarget(),
    isOver: monitor.isOver(),
    getItem: monitor.getItem()
  }
}

class Square extends Component{


  // renderTile(x,y) {
  //    if ( x === this.props.getItem.x  && y === this.props.getItem.y) {
  //      <Tile letter={"A"} x={x} y={y} style={{
  //       position: 'relative',
  //       top: 0,
  //       left: 0
  //       }}/>
  //    }
  //  }

  render(){
    console.log(this.props.getItem)
    const {connectDropTarget, isOver} = this.props
    // renderTile(this.props.square.x, this.props.square.y)
    return connectDropTarget(
        <td className={"square " + this.props.square.color}>{this.props.square.value}
        </td>
    )
  }
} 
export default compose(connect(null, {dropTile}), DropTarget(ItemTypes.TILE, squareTarget, collect))(Square);