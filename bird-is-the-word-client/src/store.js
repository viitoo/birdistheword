import {
  createStore, 
  applyMiddleware,
  combineReducers
} from 'redux'

import thunk from 'redux-thunk'
import board from './reducers/board'

const reducers = combineReducers({
  board: board
})
const middleware = [thunk]

export default createStore(
  reducers,
  window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__(),
  applyMiddleware(...middleware)
)