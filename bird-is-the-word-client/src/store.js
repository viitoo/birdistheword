import {
  createStore, 
  applyMiddleware,
  combineReducers
} from 'redux'

import thunk from 'redux-thunk'
import board from './reducers/board'
import tiles from './reducers/tiles'
import game from './reducers/game'
import auth from'./reducers/auth'

const reducers = combineReducers({
  auth: auth,
  game: game,
  board: board,
  tiles: tiles
})
const middleware = [thunk]

export default createStore(
  reducers,
  window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__(),
  applyMiddleware(...middleware)
)