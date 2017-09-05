import React, {Component} from 'react';
import { Link } from 'react-router-dom';

export default class Welcome extends Component{
  render(){
    return(
      <div>
        <h1>Welcome to Bird Is the Word!</h1>
        <Link to={"/game"}>New Game</Link>

      </div>
    )
  }
}