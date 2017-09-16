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
            <Route exact path="/" component={Login} />
            <Route exact path="/signup" component={Signup} />
            
            <PrivateRoute path="/users/:username" component={() => <User games={this.props.session.games} user={this.props.session.currentUser}/>} isAuthenticating={this.props.session.isAuthenticating} isAuthenticated={this.props.session.isAuthenticated}/>
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

export default connect(mapStateToProps, {refreshAuth})(App)
