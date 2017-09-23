
export default (state = [], action) => {
  switch(action.type){
    case 'GET_AVAILABLE_GAMES':
      return action.games
    default:
      return state;
  }
}

