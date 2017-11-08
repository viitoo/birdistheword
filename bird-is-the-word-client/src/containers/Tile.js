import React, {Component} from 'react';
import PropTypes from 'prop-types';
import { ItemTypes } from '../Constants';
import { updateTilePosition } from '../actions/tiles'
import { DragSource } from 'react-dnd'
import { compose } from 'redux'
import { connect } from 'react-redux'

const tileSource = {
  beginDrag(props){
    return {};
  },
  endDrag(props, monitor, component){
    const drop = monitor.getDropResult()
    const didDrop = monitor.didDrop();
    if (!didDrop) {
      props.updateTilePosition(props.id, props.x, props.y)
    }
    else{
      props.updateTilePosition(props.id, drop.x, drop.y)
    }
  },
   canDrag(props){
     return props.draggable ? true : false
    }
}

function collect(connect, monitor){
  return {
    connectDragSource: connect.dragSource(),
    isDragging: monitor.isDragging(),
    canDrag: monitor.canDrag()
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
          <span style={{verticalAlign: 'sub', fontSize: '0.7em'}}>{this.props.points}</span>
        </div>
      </div>
    )
  }
}

Tile.propTypes = {
  connectDragSource: PropTypes.func.isRequired,
  isDragging: PropTypes.bool.isRequired
}

export default compose(connect(null, {updateTilePosition}), DragSource(ItemTypes.TILE, tileSource, collect))(Tile);
