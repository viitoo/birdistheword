
export default (state = {}, action) => {
  switch(action.type){
    case 'START_GAME':
      return action.game

    case 'UPDATE_TILE_POSITION':
      let tile = state.tiles[action.id];
      var item = Object.assign({}, tile, { x: action.x, y: action.y, id: action.id });
      let tiles =  [...state.tiles.slice(0, action.id), item, ...state.tiles.slice(action.id + 1)];
     return Object.assign({}, state, { tiles: tiles });
    default:
      return state;
  }
}

