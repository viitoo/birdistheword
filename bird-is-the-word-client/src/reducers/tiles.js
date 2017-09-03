import bag from '../bag.json'

export default (state = bag, action) => {
  switch(action.type){
    case 'UPDATE_POSITION':
      var item = Object.assign({}, state[action.id], {x: action.x, y: action.y, id:action.id})
      return [...state.slice(0, action.id), item, ...state.slice(action.id + 1)]
    default:
      return state;
  }
}