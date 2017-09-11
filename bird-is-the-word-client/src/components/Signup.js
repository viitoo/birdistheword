import React, {Component} from 'react';
import { Link } from 'react-router-dom';

export default class Signup extends Component{
  render(){
    return(
      <div>
        <form onSubmit={console.log("submitted")}>
          <h1>Please Sign Up</h1>
          <label>Username</label>
          <input name="username"/><br/>
          <label>Password</label>
          <input name="password"/><br/>
          <label>Password Confirmation</label>
          <input name="password_confirmation"/><br/>
          <Link to="/welcome">Sign Up</Link>
        </form>
      </div>
    )
  }
}

