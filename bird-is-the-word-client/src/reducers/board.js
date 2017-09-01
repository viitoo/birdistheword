export default (state = [], action) => {
  switch(action.type){
    case 'GET_BOARD':
      return action.board
    case 'DROP_TILE':
      console.log("what")
      return state;
    default:
      return state;
  }
}