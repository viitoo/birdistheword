import React, {Component} from 'react'
import './App.css'
import Board from './Board'
import Rack from './Rack'
import { DragDropContext } from 'react-dnd';
import HTML5Backend from 'react-dnd-html5-backend';
import { compose } from 'redux'
import { connect } from 'react-redux'
import { getGame } from '../actions/game'
import { submitWord } from '../actions/game'

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
          <Board board={this.props.board} tiles={this.props.tiles} />
          <Rack tiles={this.props.tiles} rack={this.props.rack}/>
          <button onClick={() => {
            if(this.props.game.turn % 2 === 0 && this.props.game.players.slice(-1)[0].id === this.props.currentUser.id){
              alert("Please wait for player 2 to take their turn!")
            } else if (this.props.game.turn % 2 !== 0 && this.props.game.players.length === 2 && this.props.game.players.slice(0, 1)[0].id === this.props.currentUser.id){
              alert("Please wait for player 1 to tke their turn!")
            } else {
              this.props.submitWord(this.props.game.id, this.props.tiles)}
            }
          }>WORD!</button>
        </div>
      )

    }
    else
      return null
    
  }
}

const mapStateToProps = (state) => {
  return({
    game: state.game,
    board: state.game.board,
    tiles: state.game.tiles,
    rack: state.game.current_user_rack,
    currentUser: state.session.currentUser
  })
}

export default compose(connect(mapStateToProps, {getGame, submitWord}), DragDropContext(HTML5Backend))(Game);