import React, {Component} from 'react';
import PropTypes from 'prop-types';
import { ItemTypes } from '../Constants';
import { updateTilePosition } from '../actions/tile'
import { DragSource } from 'react-dnd'
import { compose } from 'redux'
import { connect } from 'react-redux'

const tileSource = {
  beginDrag(props){
    return {};
  },
  endDrag(props, monitor, component){
    const drop = monitor.getDropResult()
    props.updateTilePosition(props.id, drop.x, drop.y)
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

export default compose(connect(null, {updateTilePosition}), DragSource(ItemTypes.TILE, tileSource, collect))(Tile);
