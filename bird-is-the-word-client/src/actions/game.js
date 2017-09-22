const API_URL = process.env.REACT_APP_API_URL

// ACTION CREATORS
const startGame = game => {
  return {
    type: 'START_GAME',
    game: game
  }
}


// ASYNC ACTIONS

export const getGame = (game_id) => {
  return dispatch => {
    return fetch(`${API_URL}/games/${game_id}`,{
      method: "GET",
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${localStorage.jwt}`
      }
    })
      .then(response => response.json())
      .then(game => dispatch(startGame(game)))
      .catch(error => console.log(error));
  } 
}

export const createGame = (router) => {
  return dispatch => {
    return fetch(`${API_URL}/games`, {
      method: "POST",
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${localStorage.jwt}`
      }
    })
      .then(response => response.json())
      .then(game => {
        dispatch(startGame(game))
        router.history.replace(`/game/${game.id}`)
      })
      .catch(error => console.log(error))
  }
}

export const submitWord = (game_id, game_tiles) => {
  return dispatch => {
    return fetch(`${API_URL}/games/${game_id}`, {
      method: "PATCH",
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${localStorage.jwt}`
      },
      body: JSON.stringify({game: {tiles: game_tiles}})
      //body: JSON.stringify({game: {tiles: []}})
    })
  }
}