import React from 'react';
import ReactDOM from 'react-dom';
import registerServiceWorker from './registerServiceWorker';
import store from './store.js'
import { Provider } from 'react-redux'
import {BrowserRouter as Router, Route, Switch} from 'react-router-dom'
import './index.css';

import App from './containers/App';
import Welcome from './components/Welcome'
import Signup from './components/Signup'
import Login from './components/Login'

ReactDOM.render(
  <Provider store={store}>
    <Router>
      <div>
        <Switch>
          <Route exact path="/" component={Login} />
          <Route exact path="/signup" component={Signup} />
          <Route exact path="/welcome" component={Welcome} />
          <Route exact path="/game" component={App} />
        </ Switch>
      </div>
    </Router>
  </Provider>, 
  document.getElementById('root'));
registerServiceWorker();
