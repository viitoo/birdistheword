const API_URL = process.env.REACT_APP_API_URL

// ACTION CREATORS

const setBoard = board => {
  return {
    type: 'GET_BOARD',
    board
  }
}

export const dropTile = (x, y, letter) => {
  return{
      type: 'DROP_TILE',
      x,
      y, 
      letter
  }
 
}

// ASYNC ACTIONS

export const getBoard = () => {
  return dispatch => {
    return fetch(`${API_URL}/games`, {
      method: "GET",
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${localStorage.jwt}`
      }
    })
      .then(response => response.json())
      .then(response => response[0].board)
      .then(board => dispatch(setBoard(board)))
      .catch(error => console.log(error));
  } 
}



