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
  debugger
  return dispatch => {
    return fetch(`${API_URL}/games`)
      .then(response => response.json())
      .then(response => response[0].board)
      .then(board => dispatch(setBoard(board)))
      .catch(error => console.log(error));
  } 
}
