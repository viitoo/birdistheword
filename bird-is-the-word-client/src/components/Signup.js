import React, {Component} from 'react';
import { Link } from 'react-router-dom';

export default class Signup extends Component{
  render(){
    return(
      <div>
        <form onSubmit={console.log("submitted")}>
          <h1>Please Sign Up</h1>
          <label>Username</label>
          <input type="username"/><br/>
          <label>Password</label>
          <input type="password"/><br/>
          <label>Password Confirmation</label>
          <input type="password"/><br/>
          <button type="submit">Create user</button>
        </form>
      </div>
    )
  }
}

