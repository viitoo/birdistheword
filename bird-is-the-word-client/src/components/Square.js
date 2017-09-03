import React, {Component} from 'react';
import { ItemTypes } from '../Constants'
import { DropTarget } from 'react-dnd'
import { dropTile } from '../actions/board'
import { compose } from 'redux'
import { connect } from 'react-redux'
import Tile from './Tile'

const squareTarget = {
  drop(props, monitor, component){
    const letter = monitor.getItem().tileValue
    console.log(monitor.getItem())
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
    getItem: monitor.getItem(),
    didDrop: monitor.didDrop()
  }
}

class Square extends Component{


  renderTile(x, y){
    function findTile(tile){
      return tile.x === x && tile.y === y
    }
    const tile = this.props.tiles.find(findTile);
    if (tile !== undefined){
       return <Tile x={tile.x} y={tile.y} letter = {tile.letter}/>
    }
   
  }

  render(){
    // console.log(this.props.getItem)
    const {connectDropTarget, isOver, didDrop} = this.props
    
    return connectDropTarget(
        <td className={"square " + this.props.square.color}>{this.props.square.value}
        {this.renderTile(this.props.x, this.props.y)}
        </td>
    )
  }
} 

const mapStateToProps = (state) => {
  return({
    tiles: state.tiles
  })
}
export default compose(connect(mapStateToProps, {dropTile}), DropTarget(ItemTypes.TILE, squareTarget, collect))(Square);