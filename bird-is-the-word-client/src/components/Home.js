import React from 'react';
import SignIn from './SignInForm'
import SignUp from './SignUpForm'


const Home = (props) => {

    return(
      <div>
        <div className="welcome-banner">
          <h1>BIRD IS THE WORD</h1>
          <img src="https://i.imgur.com/IkIjFA0.gif" alt="" width="600"/>
        </div>
      
        <ul className="nav nav-tabs" role="tablist">
            <li className="nav-item">
              <a className="nav-link active" data-toggle="tab" href="#signin" role="tab">Sign In</a>
            </li>
            <li className="nav-item">
              <a className="nav-link" data-toggle="tab" href="#signup" role="tab">Sign Up</a>
            </li>
          </ul>

         
          <div className="tab-content">
            <div className="tab-pane active" id="signin" role="tabpanel">
              <SignIn />
            </div>
            <div className="tab-pane" id="signup" role="tabpanel">
              <SignUp />
            </div>
          </div>

      </div>
    )
  
}

export default Home;
