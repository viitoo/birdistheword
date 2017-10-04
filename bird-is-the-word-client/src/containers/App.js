import React, {Component} from 'react'
import {BrowserRouter as Router, Route, Switch, Redirect} from 'react-router-dom'
import { connect } from 'react-redux'
import {refreshAuth} from '../actions/sessionActions'
import User from '../components/User'
import Signup from '../components/Signup'
import Login from '../components/Login'
import Game from '../containers/Game'


const PrivateRoute = ({component: Component, path, isAuthenticated, isAuthenticating}) => {
  return(
    <Route path={path} render={(props) => {
      if (isAuthenticated){return <Component/>}
      else if (isAuthenticating){return null}
      if (!isAuthenticating && !isAuthenticated) {return <Redirect to={{pathname: '/'}} />} 
     }
    }
  />
  )
} 

const RedirectAuthenticated = ({component: Component, path, isAuthenticated, currentUser}) => {
  return(
    <Route path={path} render={(props) =>{
      if(isAuthenticated && Object.keys(currentUser).length !== 0){
        return <Redirect to={{pathname: `/users/${currentUser.username}`}} />
      }
      else {
        return <Component />
      }
    }}
    />

  )
}


class App extends Component{
  componentDidMount(){
    const token = localStorage.getItem('jwt')
    if (!!token){
      this.props.refreshAuth(token)
    }
  }
  render(){
    return (
      <div>
        <Router>
          <Switch>
            <RedirectAuthenticated exact path="/" component={Login} isAuthenticated={this.props.session.isAuthenticated} currentUser={this.props.currentUser}/>
            <RedirectAuthenticated exact path="/signup" component={Signup} isAuthenticated={this.props.session.isAuthenticated} currentUser={this.props.currentUser}/>
            <PrivateRoute exact path="/users/:username" component={User} isAuthenticating={this.props.session.isAuthenticating} isAuthenticated={this.props.session.isAuthenticated}/>
            <Route exact path= "/game/:id" component={Game} />
          
          </ Switch>
        </Router>
      </div>
    )
  }
}


const mapStateToProps = state =>{
  return{
    session: state.session,
    currentUser: state.session.currentUser,
    available_games: state.available_games
  }
}

export default connect(mapStateToProps, {refreshAuth})(App)
