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
   

    const user_games = this.props.session.games.map((game_id, index) => {
      return (
        <ul>
          <li><Link to={`/game/${game_id}`} key={index}>{game_id}</Link></li>
        </ul>
      )
    })
    console.log(this.props.available_games)

    const available_games = this.props.available_games.map((game, index) => {
      return (
        <ul>
          <li><Link to={`/game/${game.id}`} key={index}>{game.id}</Link></li>
        </ul>
      )
    })

    
    return(
      <div>
        <h1>Hey {this.props.user.username}!</h1>
        <button onClick={() => this.props.logOut(this.context.router)}>Log out</button>
        <button onClick={() => this.props.createGame(this.context.router)}>Start New Game</button><br />
        <h1>Join an Existing Game</h1>
          {available_games}
        <h1>Your games:</h1>
          {user_games}
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