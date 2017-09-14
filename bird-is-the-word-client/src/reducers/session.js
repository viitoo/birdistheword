const initialState = {
  isAuthenticated: false, 
  isAuthenticating: false, 
  currentUser:{}
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
      currentUser: action.user
    }
  case 'LOG_OUT':
    console.log("logging out..")
    return{
      isAuthenticated: false,
      isAuthenticating: false,
      currentUser: {}
    }
    default:
      return state;
  }
}