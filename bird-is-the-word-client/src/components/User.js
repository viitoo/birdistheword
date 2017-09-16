import React, {Component} from 'react';
import { Link } from 'react-router-dom';
import { logOut} from '../actions/sessionActions'
import { connect } from 'react-redux'
import { createGame } from '../actions/game'

class User extends Component{
  render(){
    const games = this.props.games.map((game, index) => {
      return <Link to={`/game/${game}`} key={index}>{game}</Link>
    })
    return(
      <div>
        <h1>Hey {this.props.user.username}!</h1>
        <button onClick={ this.props.logOut}>Log out</button>
        <Link to={"/game"} onClick={ this.props.createGame }>Start New Game</Link><br />
        <Link to={"/"}>Join an Existing Game</Link>

        <h1>Your games:</h1>
        {games}
      </div>
    )
  }
}


export default connect(null, {createGame, logOut})(User)