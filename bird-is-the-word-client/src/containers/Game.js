import React, {Component} from 'react';
import './App.css';
import Board from './Board';
import Rack from './Rack';
import GameLog from '../components/GameLog';
import { Link } from 'react-router-dom';
import { DragDropContext } from 'react-dnd';
import HTML5Backend from 'react-dnd-html5-backend';
import { compose } from 'redux';
import { connect } from 'react-redux';
import { getGame } from '../actions/game';
import { submitWord } from '../actions/game';

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
          <Link to={`/users/${this.props.currentUser.username}`}>⬅ Back to Dashboard</Link>
          <Board board={this.props.board} tiles={this.props.tiles} />
          
          <Rack tiles={this.props.tiles} rack={this.props.rack}/>
          <button onClick={() => {
            if (!!this.props.game.player_1 && !!this.props.game.player_2 === null && this.props.game.turn % 2 === 0){
              alert("Please wait for player 2 to join the game and take their turn!")
              this.props.getGame(this.props.game.id)   
            } 
            else if (!!this.props.game.player_1 && !!this.props.game.player_2 && this.props.game.turn % 2 !== 0 && this.props.game.current_player_number === 2){
                alert("Please wait for player 1 to take their turn!")
                this.props.getGame(this.props.game.id)   
              }
            else if (!!this.props.game.player_1 && !!this.props.game.player_2 && this.props.game.turn % 2 === 0 && this.props.game.current_player_number === 1){
                alert("Please wait for player 2 to take their turn!")
                this.props.getGame(this.props.game.id)   
              }
            else {
              this.props.submitWord(this.props.game.id, this.props.tiles)
            }
          }
          }>WORD!</button>

          <h1>Game log: </h1>
           <GameLog player_1={this.props.game.player_1} player_2={this.props.game.player_2}/>

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
    currentUser: state.session.currentUser,
    currentUserScore: state.game.current_user_score
  })
}

export default compose(connect(mapStateToProps, {getGame, submitWord}), DragDropContext(HTML5Backend))(Game);