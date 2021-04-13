import React from 'react';
import HistoryTimeStyle from './historyTime.style';


function secondToDatetime(seconds){
  const [ sec, min, hour] = [60, 60*60, 60*60*60]
  if(seconds < sec){ return `${seconds}초 전` } 
  if(seconds < min) { return `${Math.floor(seconds/60)}분 전` } 
  if(seconds < hour) { return  `${Math.floor(seconds/60/60)}시간 전` }  
  return `${Math.floor(seconds/60/60/24)}일 전`
}

function getPastTime(time) {
  let pastTime = Math.floor((new Date() - Date.parse(time))/1000)
  return secondToDatetime(pastTime)
}

const HistoryTime = ({ time }) => {
  let result = getPastTime(time);
  return (
    <HistoryTimeStyle className="history-time-section">
      <span className="history-time">{result}</span>
    </HistoryTimeStyle>
  );
};

export default HistoryTime;
