import React, {Component} from 'react'
import './App.css'
import Board from './Board'
import Rack from './Rack'
import { DragDropContext } from 'react-dnd';
import HTML5Backend from 'react-dnd-html5-backend';
import { compose } from 'redux'
import { connect } from 'react-redux'
import { getGame } from '../actions/game'

class Game extends Component{

  componentDidMount(){
    const game_id = parseInt(this.props.match.url.split("/")[2], 10)
    this.props.getGame(game_id)
  }

  render(){
    if (this.props.board){
      return (
        <div>
          <h1>Bird Is the Word</h1> 
          <Board board={this.props.board} />
          <Rack tiles={this.props.tiles} rack={this.props.rack}/>
        </div>
      )

    }
    else
      return null
    
  }
}

const mapStateToProps = (state) => {
  return({
    board: state.game.board,
    tiles: state.game.tiles,
    rack: state.game.current_user_rack
  })
}

export default compose(connect(mapStateToProps, {getGame}), DragDropContext(HTML5Backend))(Game);