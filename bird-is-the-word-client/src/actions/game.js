const API_URL = process.env.REACT_APP_API_URL

// ACTION CREATORS
const startGame = game => {
  return {
    type: 'START_NEW_GAME',
    game: game
  }
}



// ASYNC ACTIONS

// export const getGame = () => {
//   return dispatch => {
//     return fetch(`${API_URL}/games`)
//       .then(response => response.json())
//       .then(response => response[0].board)
//       .then(board => dispatch(setBoard(board)))
//       .catch(error => console.log(error));
//   } 
// }

export const createGame = () => {
  return dispatch => {
    return fetch(`${API_URL}/games`, {
      method: "POST",
      headers: {
        'Content-Type': 'application/json'
      }
    })
      .then(response => response.json())
      .then(game => {
        dispatch(startGame(game))
      })
      .catch(error => console.log(error))
  }
}

// export const createUser = (game) => {
//   return dispatch => {
//     return fetch(`${API_URL}/users`, {
//       method: "POST",
//       headers: {
//         'Content-Type': 'application/json'
//       },
//     })
//       .then(response => response.json())
//       .then(game => {
//         dispatch(startGame(game))
//       })
//       .catch(error => console.log(error))
//   }
// }