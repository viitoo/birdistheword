import board from '../board.json'

export default (state = board, action) => {
  switch(action.type){
    case 'GET_BOARD':
      return action.board
    default:
      return state;
  }
}