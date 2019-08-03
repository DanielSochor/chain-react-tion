import React from 'react';
//import Routes from '../../../controllers/routes'
import axios from 'axios';

function Main() {
    const testRoute = () => {
        console.log('button pressed');
        axios.get('/api/user').then(response => {
            console.log('axios get called');
            console.log(response)
        }).catch(error => {
            console.log(error);
        });
    }

    return (
        <div className='container-fluid'>
          <button onClick={testRoute}>testRoute</button>
        </div>
      );
}

export default Main;


