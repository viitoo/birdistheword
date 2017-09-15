import React, {Component} from 'react';
import { Link } from 'react-router-dom';
import { createGame } from '../actions/game'
import { logOut} from '../actions/sessionActions'
import { connect } from 'react-redux'

class User extends Component{
  componentDidMount(){
    
  }
  render(){
    return(
      <div>
        <h1>Hey {this.props.user.username}!</h1>
        <button onClick={ this.props.logOut}>Log out</button>
        <Link to={"/game"} onClick={ this.props.createGame }>Start New Game</Link><br />
        <Link to={"/"}>Join an Existing Game</Link>

        <h1>Your games:</h1>
        
      </div>
    )
  }
}


export default connect(null, {createGame, logOut})(User)