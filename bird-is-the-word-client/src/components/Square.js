import React, {Component} from 'react';
import { ItemTypes } from '../Constants'
import { DropTarget } from 'react-dnd'
import { compose } from 'redux'
import { connect } from 'react-redux'
import Tile from './Tile'

const squareTarget = {
  drop(props, monitor, component){
    return {x: props.x, y: props.y}
  }
}

function collect(connect, monitor){
  return {
    connectDropTarget: connect.dropTarget(),
  }
}

class Square extends Component{


  renderTile(x, y){
    debugger

    function findTile(tile){

      return tile.x === x && tile.y === y
    }
    var tile = this.props.tiles.find(findTile);
    
    if (tile !== undefined){
       return <Tile x={tile.x} y={tile.y} letter = {tile.letter} id={tile.id} points={tile.points}/>
    }
   
  }

  render(){
    const {connectDropTarget} = this.props
    
    return connectDropTarget(
        <td className={"square " + this.props.square.color}>{this.props.square.value}
        {this.renderTile(this.props.x, this.props.y, this.props.id, this.props.points)}
        </td>
    )
  }
} 

const mapStateToProps = (state) => {
  return({
    tiles: state.game.tiles
  })
}
export default compose(connect(mapStateToProps), DropTarget(ItemTypes.TILE, squareTarget, collect))(Square);
