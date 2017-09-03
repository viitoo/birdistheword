import bag from '../bag.json'

export default (state = bag, action) => {
  switch(action.type){
    case 'UPDATE_POSITION':
      return [...state.slice(0, action.item.id), action.item, ...state.slice(action.item.id + 1)]
    default:
      return state;
  }
}