import {
  createStore, 
  applyMiddleware,
  combineReducers
} from 'redux'

import thunk from 'redux-thunk'
import game from './reducers/game'
import session from'./reducers/session'
import available_games from './reducers/available_games'

const reducers = combineReducers({
  session: session,
  game: game,
  available_games: available_games
})


export default createStore(
  reducers,
  window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__(),
  applyMiddleware(thunk)
)