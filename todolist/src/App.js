import React from 'react';
import Header from './components/header/header.jsx';
import Body from './components/body/body.jsx';
import Log from './components/log/log.jsx';
import './style.scss';
import './reset.scss';

const App = () => {
  return (
    <div className="App">
      <Header />
      <Body />
      {/* <Log /> */}
    </div>
  );
};

export default App;
