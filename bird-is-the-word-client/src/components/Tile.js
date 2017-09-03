import React, {Component} from 'react';
import PropTypes from 'prop-types';
import { ItemTypes } from '../Constants';
import { DragSource } from 'react-dnd'

const tileSource = {
  beginDrag(props){
    console.log(props.letter)
    return {tileValue: props.letter, x: props.x, y: props.y};
  }
}

function collect(connect, monitor){
  return {
    connectDragSource: connect.dragSource(),
    isDragging: monitor.isDragging()
  }
}

class Tile extends Component{
  render(){
    const { connectDragSource, isDragging } = this.props;
    return connectDragSource(
      <div style={{
        opacity: isDragging ? 0.5 : 1,
        fontWeight: 'bold',
        cursor: 'move'
      }}>
        <div className="tile">
          {this.props.letter}
        </div>
      </div>
    )
  }
}

Tile.propTypes = {
  connectDragSource: PropTypes.func.isRequired,
  isDragging: PropTypes.bool.isRequired
}

export default DragSource(ItemTypes.TILE, tileSource, collect)(Tile);
