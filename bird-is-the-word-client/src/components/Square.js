import React, {Component} from 'react';
import { ItemTypes } from '../Constants'
import { DropTarget } from 'react-dnd'
import { moveTile } from '../Game'

const squareTarget = {
  drop(props){
    moveTile(props.x, props.y)
  }
}

function collect(connect, monitor){
  return {
    connectDropTarget: connect.dropTarget(),
    isOver: monitor.isOver()
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

export default DropTarget(ItemTypes.TILE, squareTarget, collect)(Square);