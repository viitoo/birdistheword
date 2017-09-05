import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './containers/App';
import Welcome from './components/Welcome'
import registerServiceWorker from './registerServiceWorker';
import store from './store.js'
import { Provider } from 'react-redux'
import {BrowserRouter as Router, Route} from 'react-router-dom'

ReactDOM.render(
  <Provider store={store}>
    <Router>
      <div>
        <Route exact path="/" component={Welcome} />
        <Route exact path="/game" component={App} />
      </div>
    </Router>
  </Provider>, 
  document.getElementById('root'));
registerServiceWorker();
