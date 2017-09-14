import React, {Component} from 'react';
import { Link } from 'react-router-dom';
import { createGame } from '../actions/game'
import { connect } from 'react-redux'
class Welcome extends Component{
  render(){
    return(
      <div>
        <h1>Welcome to Bird Is the Word!</h1>
        <Link to={"/game"} onClick={ this.props.createGame }>Start New Game</Link><br />
        <Link to={"/"}>Join an Existing Game</Link>
        <h1>Continue playing</h1>
        <p>vs. Jamie </p>
        <p>vs. Andrea</p>
        <p>vs.Sarah</p>
      </div>
    )
  }
}


export default connect(null, {createGame})(Welcome)