import {
  createStore, 
  applyMiddleware,
  combineReducers
} from 'redux'

import ReduxThunk from 'redux-thunk'
import game from './reducers/game'
import session from'./reducers/session'

const reducers = combineReducers({
  session: session,
  game: game,
})


export default createStore(
  reducers,
  window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__(),
  applyMiddleware(ReduxThunk)
)