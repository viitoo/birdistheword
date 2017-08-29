import React, {Component} from 'react'
import './App.css'
import Board from './Board'
import Rack from './Rack'
import { DragDropContext } from 'react-dnd';
import HTML5Backend from 'react-dnd-html5-backend';
import board from '../board.json'
import players from '../players.json'
import bag from '../bag.json'

class App extends Component{

  render(){
    debugger
    return (
      <div className="App">
        <h1>Bird Is the Word</h1>
        <Board board={board} />
        <br />
        <Rack players={players} bag={bag}/>
      </div>
    )
  }
}

export default DragDropContext(HTML5Backend)(App);