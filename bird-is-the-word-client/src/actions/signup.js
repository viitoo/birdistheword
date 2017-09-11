/* Action Creators */

export const authenticationRequest = () => {
  return{
    type: 'AUTHENTICATION_REQUEST'
  }
}

/* Async Actions*/

export const signup = (user, router) => {
  return dispatch => {
    dispatch(authenticationRequest())
    return fetch('/users', {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ user: userDetails })
    })
    .then(response => response.json())
    .then(body => {
      dispatch(setCurrentUser(body.user))
      dispatch(reset('signup'))
    })
  }
}