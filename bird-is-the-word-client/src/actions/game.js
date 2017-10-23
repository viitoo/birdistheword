const API_URL = process.env.REACT_APP_API_URL

// ACTION CREATORS
const startGame = game => {
  return {
    type: 'START_GAME',
    game: game
  }
}

const setAvailableGames = games =>{
  return {
    type: 'GET_AVAILABLE_GAMES',
    games: games
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
      .then(fetchedGame => {     
          dispatch(startGame(fetchedGame))
      })
      .catch(error => {
        console.log(error)
      });
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
    })
    .then(response => response.json())
    .then(game => {
      dispatch(startGame(game))
    })
     .catch(error => console.log(error))
  }
   
}

export const getAvailableGames = () =>
{
  return dispatch => {
    return fetch(`${API_URL}/available_games`, {
      method: "GET",
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${localStorage.jwt}`
      }
    })
  
    .then(response => response.json())
    .then(games => {
      dispatch(setAvailableGames(games))
      console.log(games)
    })
  }
}

export const skipTurn = (game_id) => {
  return dispatch => {
    return fetch(`${API_URL}/skip_turn`, {
      method: "POST",
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${localStorage.jwt}`
      },
      body: JSON.stringify({id: game_id})
    })
  .then (response => response.json())
  .then(game =>{
    dispatch(startGame(game))
  })
  .catch(error => console.log(error))
  }
}
