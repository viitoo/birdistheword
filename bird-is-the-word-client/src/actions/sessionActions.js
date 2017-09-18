
const API_URL = process.env.REACT_APP_API_URL

/* Action Creators */

export const authenticationRequest = () => {
  return{
    type: 'AUTHENTICATION_REQUEST'
  }
}

export const setCurrentUser = user => {
  return{
    type: 'AUTHENTICATION_SUCCESS',
    user
  }
}

export const setCurrentUserGames = (games, user) => {
  return{
    type: 'GET_USER_GAMES',
    games,
    user
  }
}

export const logOut = (router) => {
  return {
    type: 'LOG_OUT'
  }
  router.history.replace('/')
}

/* Async Actions*/

export const logInUser = (user, router) => {
  return dispatch => {
    dispatch(authenticationRequest())
    return fetch(`${API_URL}/auth`, {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ user })
  })
    .then(response => response.json())
    .then(body => {
      const slug = body.user.username
      localStorage.setItem('jwt', body.token)
      // localStorage.setItem('user_id', body.user.id)
      // localStorage.setItem('username', body.user.username)
      dispatch(setCurrentUser(body.user))
      dispatch(getUserGames(body.user))
      router.history.replace(`/users/${slug}`)

     
    })
    .catch(error => {
      error => (console.log(error))
      // throw new SubmissionError(error)
    })
  }
}

export const signUpUser = (user, router) => {
  return dispatch => {
    dispatch(authenticationRequest())
    return fetch(`${API_URL}/users`, {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ user })
    })
    .then(response => response.json())
    .then(body => {
      const slug = body.user.username
      localStorage.setItem('jwt', body.token)

      // localStorage.setItem('user_id', body.user.id)
      // localStorage.setItem('username', body.user.username)
      // dispatch(reset('signup'))
      dispatch(setCurrentUser(body.user))
      dispatch(getUserGames(body.user))
      router.history.replace(`/users/${slug}`)
      
    })
    .catch(error => {
      error => (console.log(error))
      // throw new SubmissionError(error)
    })
  }
}

export const refreshAuth = (token) => {
    return dispatch => {
    dispatch(authenticationRequest())
    return fetch(`${API_URL}/auth/refresh`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Authorization':  `JWT ${token}`
      }
  })
    .then(response => response.json())
    .then(body => {
      console.log(body.user)
      dispatch(setCurrentUser(body.user)) 
      dispatch(getUserGames(body.user))  
    })
    .catch(error => {
      error => (console.log(error))
      // throw new SubmissionError(error)
    })
  }
}

export const getUserGames = (user) => {
  return dispatch => {
    return fetch(`${API_URL}/users/${user.id}/games`)
      .then(response => response.json())
      .then (games => {
        dispatch(setCurrentUserGames(games, user))
      })
      .catch(error => console.log(error))
  }
}