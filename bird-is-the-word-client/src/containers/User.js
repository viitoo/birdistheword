import React, {Component} from 'react';
import { Link } from 'react-router-dom';
import { logOut} from '../actions/sessionActions'
import { connect } from 'react-redux'
import { createGame } from '../actions/game'
import PropTypes from 'prop-types'
import {getAvailableGames} from '../actions/game'

class User extends Component{
  static contextTypes = {
    router: PropTypes.object
  }

  componentDidMount(){
    this.props.getAvailableGames()
  }

  render(){
   
    console.log(this.props.available_games)
    const user_games = this.props.session.games.map((game, index) => {
      return ( 
        <Link to={`/game/${game.id}`} key={index} className="list-group-item list-group-item-action"> {game.player_1.username.toUpperCase()}  { game.player_2 ? " vs. " + game.player_2.username.toUpperCase() : " waiting for player 2 to join"} </Link>
      )
    })

    const available_games = this.props.available_games.map((game, index) => {
      return (
        <Link to={`/game/${game.id}`} key={index} className="list-group-item list-group-item-action">Play with {game.player_1.username.toUpperCase()}</Link>
      )
    })

    
    return(
      <div>

        <nav className="navbar navbar-toggleable-md navbar-light bg-faded">
          <button className="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span className="navbar-toggler-icon"></span>
          </button>
          <a className="navbar-brand" href="#">
            <img src="https://i.imgur.com/7pVyVwc.gif" alt="" width="250"/>
          </a>

          <div className="collapse navbar-collapse" id="navbarSupportedContent">
            <ul className="navbar-nav mr-auto">
        
            </ul>
            <ul className="nav navbar-nav navbar-right">
              <li className="nav-item">
                <h3 className="greeting">Greetings, {this.props.user.username}!</h3>
              </li>
              <li className="nav-item">
                <button type="link" className="btn btn-danger" onClick={() => this.props.logOut(this.context.router)}><i className="fa fa-sign-out" aria-hidden="true"></i>   Sign out</button>
              </li>
            </ul>
          </div>
        </nav>

        <div className="new-game">
          <button type="button" className="btn btn-danger" onClick={() => this.props.createGame(this.context.router)}><i className="fa fa-plus-circle" aria-hidden="true"></i>   New Game</button><br />
        </div>
        <h1>Join a Game</h1>
          <div className="list-group">
              { this.props.available_games.length < 1 ? <div><h3><i className="fa fa-frown-o fa-lg" aria-hidden="true"></i> no games available</h3></div>  : available_games}
          </div>
        <h1>Continue Playing</h1>
          <div className="list-group">
            { this.props.session.games < 1 ? <div><h3><i className="fa fa-frown-o fa-lg" aria-hidden="true"></i> you don't have any games yet</h3></div>  : user_games}
          </div>
      </div>
    )
  }
}

const mapStateToProps = state =>{
  return{
    session: state.session,
    available_games: state.available_games,
    user: state.session.currentUser
  }
}


export default connect(mapStateToProps, {createGame, logOut, getAvailableGames})(User)