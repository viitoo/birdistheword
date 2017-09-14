import React, {Component} from 'react'
import {BrowserRouter as Router, Route, Switch, Redirect} from 'react-router-dom'
import { connect } from 'react-redux'

import User from '../components/User'
import Signup from '../components/Signup'
import Login from '../components/Login'
import Game from '../containers/Game'


function PrivateRoute ({component: Component, path, isAuthenticated}){
  return(
    <Route path={path} render={(props) => isAuthenticated ? <Component/> : <Redirect to={{pathname: '/'}} />} />
  )
}

class App extends Component{

  componentDidMount(){
    // console.log("authenticating")
    // const token = localStorage.getItem('jwt')

  }

  render(){
    return (
      <div>
        <Router>
          <Switch>
            <Route exact path="/" component={Login} />
            <Route exact path="/signup" component={Signup} />
            
            <PrivateRoute path="/users/:username" component={User} isAuthenticated={this.props.isAuthenticated}/>
            <Route exact path= "/users/:username/game/:id" component={Game} />
          
          </ Switch>
        </Router>
      </div>
    )
  }
}

const mapStateToProps = state =>{
  return{
    session: state.session
  }
}

export default connect(mapStateToProps)(App)
