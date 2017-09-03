import bag from '../bag.json'

export default (state = bag, action) => {
  switch(action.type){
    case 'UPDATE_POSITION':

     return [...state.slice(0, action.id),
          {x: action.x, y: action.y},
        ...row.slice(action.id + 1) ]
    default:
      return state;
  }
}