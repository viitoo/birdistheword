import React from 'react';
import SignIn from './SignInForm'
import SignUp from './SignUpForm'


const Home = (props) => {

    return(
      <div>
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
