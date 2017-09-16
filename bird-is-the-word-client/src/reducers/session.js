const initialState = {
  isAuthenticated: !!localStorage.getItem('jwt') ? true : false, 
  isAuthenticating: false, 
  currentUser: {},
  games: [],
}

// action = {type: 'AUTHENTICATION_REQUEST'}

// action = {type: 'AUTHENTICATION_SUCCESS', user: {id: 1, username: 'whatever'}}

export default (state = initialState, action) => {
  switch(action.type){
  case 'AUTHENTICATION_REQUEST':
    return {
      ...state,
      isAuthenticating: true
    }
  case 'AUTHENTICATION_SUCCESS':
    return{
      isAuthenticated: true,
      isAuthenticating: false,
      currentUser: action.user,
      games: []
    }
  case 'LOG_OUT':
    console.log("logging out..")
    return{
      isAuthenticated: false,
      isAuthenticating: false,
      currentUser: {},
      games: []
    }
  case 'GET_USER_GAMES':
    return{
      ...state,
      games: action.games
    }
  default:
    return state;
  }
}