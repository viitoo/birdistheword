export const createUser = () => {
  return dispatch => {
    return fetch(`${API_URL}/users`, {
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
