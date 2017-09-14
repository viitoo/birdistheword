import React, {Component} from 'react';
import { connect } from 'react-redux'
import {bindActionCreators} from 'redux';  
import PropTypes from 'prop-types'
import * as sessionActions from '../actions/sessionActions';

class Signup extends Component{

  static contextTypes = {
    router: PropTypes.object
  }

  constructor(props){
    super(props);
    this.state = {user: {username: '', password: '', password_confirmation: ''}}
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
    this.props.actions.signUpUser(this.state.user, this.context.router)
  }
  render(){
    return(
      <div>
        <h1>Please Sign Up</h1>
        

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
        
          <label>Password Confirmation</label>
          <input
            name="password_confirmation"
            type="password"
            value={this.state.user.password_confirmation}
            onChange={this.onChange}/>

          <input
            type="submit"
            onClick={this.onSave}/>
         
      </div>
    )
  }
}

function mapDispatchToProps(dispatch) {  
  return {
    actions: bindActionCreators(sessionActions, dispatch)
  };
}

export default connect(null, mapDispatchToProps)(Signup)