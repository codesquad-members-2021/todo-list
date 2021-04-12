import React, { useState, useEffect } from 'react';
import LogHeader from './logHeader/logHeader.jsx';
import LogCards from './logCards/logCards.jsx';
import { getData } from '../../utils/axios.js';
import LogStyle from './log.style';

const Log = () => {
  const [logCards, setLogCards] = useState([]);
  const [time, setTime] = useState();

  const getLogData = () => {
    getData('http://localhost:3002/log') //
      .then(res => setLogCards(res.data));
  };

  const getDate = () => {
    const today = new Date();
    const time = `${today.getFullYear()}-${today.getMonth() + 1}-${today.getDate()} ${today.getHours()}:${today.getMinutes()}`;
    setTime(time);
  };

  useEffect(() => {
    getLogData();
    getDate();
  }, []);

  return (
    <LogStyle className="log">
      <LogHeader />
      {logCards.map((logData, index) => (
        <LogCards key={index} logData={logData} time={time} />
      ))}
    </LogStyle>
  );
};

export default Log;
