import board from './board.json'
import {
  createStore, 
  applyMiddleware,
  combineReducers
} from 'redux'

import thunk from 'redux-thunk'

const boardReducer = (state = board, action) => {
  switch(action.type){
    case 'GET_BOARD':
      return action.board
    default:
      return state;
  }
}

const reducers = combineReducers({
  board: boardReducer
})
const middleware = [thunk]

export default createStore(
  reducers,
  applyMiddleware(...middleware),
  window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__()
)