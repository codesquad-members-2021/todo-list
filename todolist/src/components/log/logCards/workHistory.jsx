import React from "react";

const WorkHistory = ({ columnTitle, cardTitle, action }) => {
  return (
    <div className="work-history-section">
      <span className="work-history">
        {columnTitle}에 {cardTitle}를 {action}하였습니다.
      </span>
    </div>
  );
};

export default WorkHistory;
