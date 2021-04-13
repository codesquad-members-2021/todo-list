import React, { useState, useEffect } from 'react';
import LogHeader from './logHeader/logHeader.jsx';
import LogCards from './logCards/logCards.jsx';
import { getData } from '../../utils/axios.js';
import LogStyle from './log.style';
import LogCardsWrapper from './logCardsWrapper.style';

const Log = ( { handleLogRender }) => {
  const [logCards, setLogCards] = useState([]);

  const getLogData = () => {
    getData("http://localhost:3002/log") //
      .then((res) => setLogCards(res.data));
  };

  useEffect(() => {
    getLogData();
  }, []);

  return (
    <LogStyle className="log">
      <LogHeader handleLogRender={ handleLogRender } />
        <LogCardsWrapper>
      {logCards.map((logData, index) => (
        <LogCards key={index} logData={logData} />
      ))}
        </LogCardsWrapper>
    </LogStyle>
  );
};

export default Log;
