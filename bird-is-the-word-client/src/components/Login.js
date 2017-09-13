import React, {Component} from 'react';
import { connect } from 'react-redux'
import {bindActionCreators} from 'redux';  
import PropTypes from 'prop-types'
import { Link } from 'react-router-dom';
import * as sessionActions from '../actions/sessionActions';

class Login extends Component{

  static contextTypes = {
    router: PropTypes.object
  }

  constructor(props){
    super(props);
    this.state = {user: {username: '', password: ''}}
    this.onChange = this.onChange.bind(this);
    this.onSave = this.onSave.bind(this);
  }

  onChange(event){
    const field = event.target.name;
    const user = this.state.user;
    user[field] = event.target.value;
    return this.setState({user: user})
  }

  onSave(event){
    event.preventDefault();
    this.props.actions.logInUser(this.state.user, this.context.router)
  }
  render(){
    return(
      <div>
        <h1>Please Log In</h1>
         <form>

         <label>Username</label>
          <input
            name="username"
            value={this.state.user.username}
            onChange={this.onChange}/>

          <label>Password</label>
          <input
            name="password"
            type="password"
            value={this.state.user.password}
            onChange={this.onChange}/>

          <input
            type="submit"
            onClick={this.onSave}/>
          </form>
          Don't have an account? <Link to={"/signup"}>Sign Up</Link><br/>
      </div>
    )
  }
}

function mapDispatchToProps(dispatch) {  
  return {
    actions: bindActionCreators(sessionActions, dispatch)
  };
}

export default connect(null, mapDispatchToProps)(Login)