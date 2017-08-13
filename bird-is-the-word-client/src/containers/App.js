import React, {Component} from 'react'
import './App.css'
import Board from './Board'
import board from '../board.json'

class App extends Component{
  render(){
    return (
      <div className="App">
        <h1>Bird Is the Word</h1>
        <Board board={board} />
      </div>
    )
  }
}
export default App;
