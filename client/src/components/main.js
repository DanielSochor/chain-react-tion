import React from 'react';
import Routes from '../../../controllers/routes'

function Main() {
    const testRoute = () => {

        console.log('button pressed');
        Routes("/api/user")
    }

    return (
        <div className='container-fluid'>
          <button onClick={testRoute}>testRoute</button>
        </div>
      );
}

export default Main;


