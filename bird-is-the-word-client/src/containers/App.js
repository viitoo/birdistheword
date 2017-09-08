import React, {Component} from 'react'
import './App.css'
import Board from './Board'
import Rack from './Rack'
import { DragDropContext } from 'react-dnd';
import HTML5Backend from 'react-dnd-html5-backend';
import players from '../players.json'
import bag from '../bag.json'
import { compose } from 'redux'
import { connect } from 'react-redux'
import { getBoard } from '../actions/board'

class App extends Component{
  componentDidMount(){
      this.props.getBoard()
  }

  render(){
    return (
      <div className="App">
        <h1>Bird Is the Word</h1>
        <Board board={this.props.board}/>
        <Rack players={players} bag={bag}/>
      </div>
    )
  }
}

const mapStateToProps = (state) => {
  return({
    board: state.board,
    tiles: state.tiles,
    // players: state.players
  })
}

export default compose(connect(mapStateToProps, {getBoard}), DragDropContext(HTML5Backend))(App);