export default (state = [], action) => {
  switch(action.type){
    case 'GET_BOARD':
      return action.board
    case 'DROP_TILE':
      // const newState = JSON.parse(JSON.stringify(state))
      // newState[action.x][action.y].value = action.letter
      // return newState

      const row = state[action.x];
      const updatedRow = [
        ...row.slice(0, action.y),
        { letter: action.letter },
        ...row.slice(action.y + 1)
      ];

      return [
        ...state.slice(0, action.x),
        updatedRow,
        ...state.slice(action.x + 1)
      ];
    default:
      return state;
  }
}