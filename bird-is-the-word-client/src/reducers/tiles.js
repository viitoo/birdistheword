import bag from '../bag.json'

export default (state = bag, action) => {
  switch(action.type){
    case 'UPDATE_POSITION':
      return null
    default:
      return state;
  }
}