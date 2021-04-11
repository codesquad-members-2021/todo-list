import React from "react";

const HistoryTime = ({ time }) => {
  return (
    <div className="history-time-section">
      <span className="history-time">로그기록시간 : {time}</span>
    </div>
  );
};

export default HistoryTime;
