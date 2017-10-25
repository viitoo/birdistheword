import React, {Component} from 'react';
import { Link } from 'react-router-dom';
import { logOut} from '../actions/sessionActions'
import { connect } from 'react-redux'
import { createGame } from '../actions/game'
import PropTypes from 'prop-types'
import {getAvailableGames} from '../actions/game'

class User extends Component{
  static contextTypes = {
    router: PropTypes.object
  }

  componentDidMount(){
    this.props.getAvailableGames()
  }

  render(){
   
    console.log(this.props.available_games)
    const user_games = this.props.session.games.map((game, index) => {
      return ( 
        <Link to={`/game/${game.id}`} key={index} className="list-group-item list-group-item-action"> {game.player_1.username.toUpperCase()}  { game.player_2 ? " vs. " + game.player_2.username.toUpperCase() : " waiting for player 2 to join"} </Link>
      )
    })

    const available_games = this.props.available_games.map((game, index) => {
      return (
        <Link to={`/game/${game.id}`} key={index} className="list-group-item list-group-item-action">Play with {game.player_1.username.toUpperCase()}</Link>
      )
    })

    
    return(
      <div>
        <div className="navbar">
          <nav>
            <div className="navbar-item"><i className="fa fa-twitter fa-3x" aria-hidden="true"></i></div>
            <h2 className="navbar-item">Howdy, {this.props.user.username}!</h2>
            <div className="navbar-item">
              <button type="button" className="btn btn-danger" onClick={() => this.props.logOut(this.context.router)}><i className="fa fa-sign-out" aria-hidden="true"></i>   Sign out</button>
            </div>
          </nav>
        </div>

        <div className="new-game">
          <button type="button" className="btn btn-danger" onClick={() => this.props.createGame(this.context.router)}><i className="fa fa-plus-circle" aria-hidden="true"></i>   New Game</button><br />
        </div>
        <h1>Join a Game</h1>
          <div className="list-group">
            {available_games}
          </div>
        <h1>Continue Playing</h1>
          <div className="list-group">
            {user_games}
          </div>
      </div>
    )
  }
}

const mapStateToProps = state =>{
  return{
    session: state.session,
    available_games: state.available_games,
    user: state.session.currentUser
  }
}


export default connect(mapStateToProps, {createGame, logOut, getAvailableGames})(User)