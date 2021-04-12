import React from 'react';
import HistoryTimeStyle from './historyTime.style';

const HistoryTime = ({ time }) => {
  return (
    <HistoryTimeStyle className="history-time-section">
      <span className="history-time">로그기록시간 : {time}</span>
    </HistoryTimeStyle>
  );
};

export default HistoryTime;
