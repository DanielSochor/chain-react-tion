import React, { Component } from "react";
import "./App.css";

import Main from './components/main'

class App extends Component {
  render() {
    return (
      <div className="App">
          <h2>Healthy People</h2>
          <Main />
      </div>
    );
  }
}

export default App;
