import React, { useState, useEffect } from 'react';
import LogHeader from './logHeader/logHeader.jsx';
import LogCards from './logCards/logCards.jsx';
import { getData } from '../../utils/axios.js';
import LogStyle from './log.style';

const Log = () => {
  const [logCards, setLogCards] = useState([]);

  const getLogData = () => {
    getData('http://localhost:3002/log') //
      .then(res => setLogCards(res.data));
  };

  useEffect(() => {
    getLogData();
  }, []);

  return (
    <LogStyle className="log">
      <LogHeader />
      {logCards.map((logData, index) => (
        <LogCards key={index} logData={logData} />
      ))}
    </LogStyle>
  );
};

export default Log;
