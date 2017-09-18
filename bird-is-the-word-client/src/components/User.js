import React, {Component} from 'react';
import { Link } from 'react-router-dom';
import { logOut} from '../actions/sessionActions'
import { connect } from 'react-redux'
import { createGame } from '../actions/game'
import PropTypes from 'prop-types'

class User extends Component{
  static contextTypes = {
    router: PropTypes.object
  }

  constructor(props){
    super(props);
    this.newGame = this.newGame.bind(this);
  }

   newGame(){
      this.props.createGame(this.context.router)
    }

  render(){
    const games = this.props.games.map((game, index) => {
      return <Link to={`/game/${game}`} key={index}>{game}</Link>
    })
    return(
      <div>
        <h1>Hey {this.props.user.username}!</h1>
        <button onClick={ this.props.logOut}>Log out</button>
        <button onClick={this.newGame}>Start New Game</button><br />
        <Link to={"/"}>Join an Existing Game</Link>

        <h1>Your games:</h1>
        {games}
      </div>
    )
  }
}


export default connect(null, {createGame, logOut})(User)