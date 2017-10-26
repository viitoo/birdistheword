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
import { skipTurn } from '../actions/game'


class Game extends Component{

  componentDidMount(){
    const game_id = parseInt(this.props.match.url.split("/")[2], 10)
    this.props.getGame(game_id)   
  }

  render(){
    if (this.props.board){
     
      return (
        <div>
          <nav className="navbar navbar-toggleable-md navbar-light bg-faded">
            <button className="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span className="navbar-toggler-icon"></span>
            </button>
            <a className="navbar-brand" href="#">
              <img src="https://i.imgur.com/7pVyVwc.gif" alt="" width="200"/>
            </a>

            <div className="collapse navbar-collapse" id="navbarSupportedContent">
              <ul className="navbar-nav mr-auto">
            
              </ul>
              <ul className="nav navbar-nav navbar-right">
                <li className="nav-item">
                  <Link className="btn btn-danger navbar-item" role="button" to={`/users/${this.props.currentUser.username}`}>⬅ Back</Link>
                </li>
              </ul>
            </div>
          </nav>

          <div className="row">
            <div className="col-sm-7">
              
              <Board board={this.props.board} tiles={this.props.tiles} />
              
              <Rack tiles={this.props.tiles} rack={this.props.rack}/>
              <button className="btn btn-primary display-inline" type="button"  onClick={() => {
                if (this.props.game.player_1 && this.props.game.player_2 === null && this.props.game.turn % 2 === 0){
                  alert("Please wait for player 2 to joing the game and take their turn!")
                  this.props.getGame(this.props.game.id)   
                } 
                else if (this.props.game.player_1 && this.props.game.player_2 && this.props.game.turn % 2 !== 0 && this.props.game.current_player_number === 2){
                    alert("Please wait for player 1 to take their turn!")
                    this.props.getGame(this.props.game.id)   
                  }
                else if (this.props.game.player_1 && this.props.game.player_2 && this.props.game.turn % 2 === 0 && this.props.game.current_player_number === 1){
                    alert("Please wait for player 2 to take their turn!")
                    this.props.fetchGame(this.props.game.id)   
                  }
                else {
                  this.props.submitWord(this.props.game.id, this.props.tiles)
                }
              }
              }>WORD!</button><br/>
              <button className="btn btn-primary display-inline" type="button" onClick={() => {
                if (this.props.game.turn % 2 !== 0 && this.props.game.current_player_number === 2){
                  alert("Please wait for player 1 to take their turn!")
                } else if (this.props.game.turn % 2 === 0 && this.props.game.current_player_number === 1){
                  alert("Please wait for player 2 to take their turn!")
                }else{
                  this.props.skipTurn(this.props.game.id)
                }

                }}>Skip turn</button>
            </div>
            <div className="col-sm-5">

              <h1>Your current score: {this.props.game.current_player_number === 1 ? this.props.game.player_1.score : this.props.game.player_2.score}</h1>
                <div className="row">
                  <div className="col-sm-6">
                    <div className="square-sm red score-explanation"></div><p className="score-explanation">Double word score</p><br/>
                    <div className="square-sm blue score-explanation"></div><p className="score-explanation">Double letter score</p>
                  </div>
                  <div className="col-sm-6">
                    <div className="square-sm orange score-explanation"></div><p className="score-explanation">Triple word score</p><br/>
                    <div className="square-sm green score-explanation"></div><p className="score-explanation">Tripple letter score</p>
                  </div>
                </div>
      
                <button className="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                  Show Game Log
                </button>
              <div className="collapse" id="collapseExample">
                <div className="card card-block">
                   <GameLog player_1={this.props.game.player_1} player_2={this.props.game.player_2}/>
                </div>
              </div>
            </div>
          </div>
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

export default compose(connect(mapStateToProps, {getGame, submitWord, skipTurn}), DragDropContext(HTML5Backend))(Game);