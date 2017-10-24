import React, {Component} from 'react';
import { connect } from 'react-redux'
import {bindActionCreators} from 'redux';  
import PropTypes from 'prop-types'
import * as sessionActions from '../actions/sessionActions';

class SignUp extends Component{

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
        <form>
          <div class="form-group">
            <label>Username</label>
            <input
            type="username"
            className="form-control"
            name="username"
            value={this.state.user.username}
            placeholder="Enter email"
            onChange={this.onChange}/>
          </div>
          <div class="form-group">
            <label>Password</label>
            <input
            type="password"
            className="form-control"
            name="username"
            value={this.state.user.password}
            placeholder="Password"
            onChange={this.onChange}/>
          </div>

          <div class="form-group">
            <label>Password Confirmation</label>
            <input
            type="password"
            className="form-control"
            name="username"
            value={this.state.user.password_confirmation}
            placeholder="Password confirmation"
            onChange={this.onChange}/>
          </div>
          <br />
          <button type="buttton" className="btn btn-primary" onClick={this.onSave}>Submit</button>
        </form>
      </div>
    )
  }
}

function mapDispatchToProps(dispatch) {  
  return {
    actions: bindActionCreators(sessionActions, dispatch)
  };
}

export default connect(null, mapDispatchToProps)(SignUp)