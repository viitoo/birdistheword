import React, {Component} from 'react';
import { ItemTypes } from '../Constants'
import { DropTarget } from 'react-dnd'
import { dropTile } from '../actions/board'
import { compose } from 'redux'
import { connect } from 'react-redux'

const squareTarget = {
  drop(props, monitor){
    const letter = monitor.getItem().tileValue
    dropTile(props.x, props.y, letter)
  },
}

function collect(connect, monitor){
  return {
    connectDropTarget: connect.dropTarget(),
    isOver: monitor.isOver(),
  }
}

class Square extends Component{
  render(){
    const {connectDropTarget, isOver} = this.props
    return connectDropTarget(
      <th className={"square " + this.props.square.color}>{this.props.square.value}</th>
    )
  }
} 
export default compose(DropTarget(ItemTypes.TILE, squareTarget, collect), connect(null, {dropTile}))(Square);