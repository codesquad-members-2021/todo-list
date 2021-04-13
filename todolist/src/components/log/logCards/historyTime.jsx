import React from 'react';
import HistoryTimeStyle from './historyTime.style';


function getPastTime(time) {
  let writeTime = time;
  let nowTime = new Date();
  let result = Math.floor((nowTime - writeTime)/1000)
  let resultStr =''
  if(result < 60){
    resultStr = `${result}초 전`
  } else if(result < 60 * 60) {
    resultStr = `${Math.floor(result/60)}분 전`
  } else if(result < 60 * 60 * 60) {
    resultStr = `${Math.floor(result/60 * 60)}시간 전`
  } else if(result < 60 * 60 * 60 * 24) {
    resultStr = `${Math.floor(result/60 * 60 * 60)}일 전`
  }
  return resultStr
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
