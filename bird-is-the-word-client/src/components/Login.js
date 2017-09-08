import React, {Component} from 'react';
import { Link } from 'react-router-dom';

export default class Login extends Component{
  render(){
    return(
      <div>
        <h1>Please Log In</h1>
        Username:<input name="username"/><br/>
        Password:<input name="password"/>

        <h1>or Sign Up</h1>
        Username:<input name="username"/><br/>
        Password:<input name="password"/>
      </div>
    )
  }
}

