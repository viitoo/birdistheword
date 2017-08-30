const API_URL = process.env.REACT_APP_API_URL

// ACTION CREATORS

const setBoard = board => {
  return {
    type: 'GET_BOARD',
    board
  }
}
// ASYNC ACTIONS

export const getBoard = () => {
  return dispatch => {
    return fetch(`${API_URL}/games`)
      .then(response => console.log(response.json()))
      .catch(error => console.log(error));
  } 
}
