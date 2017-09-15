import {
  createStore, 
  applyMiddleware,
  combineReducers
} from 'redux'

import ReduxThunk from 'redux-thunk'
import board from './reducers/board'
import tiles from './reducers/tiles'
import game from './reducers/game'
import session from'./reducers/session'

const reducers = combineReducers({
  session: session,
  game: game,
  board: board,
  tiles: tiles
})


export default createStore(
  reducers,
  window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__(),
  applyMiddleware(ReduxThunk)
)