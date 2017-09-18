import bag from '../bag.json'

export default (state = {}, action) => {
  switch(action.type){
    case 'START_GAME':
      return action.game
    default:
      return state;
  }
}