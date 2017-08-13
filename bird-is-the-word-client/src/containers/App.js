import React, {Component} from 'react'
import './App.css'
import Board from './Board'
import board from '../board.json'
import players from '../players.json'
import Rack from './Rack'

class App extends Component{

  render(){
   debugger
    return (
      <div className="App">
        <h1>Bird Is the Word</h1>
        <Board board={board} />
        <br />
        <Rack players={players}/>
      </div>
    )
  }
}
export default App;
