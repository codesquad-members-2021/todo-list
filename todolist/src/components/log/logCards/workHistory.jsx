import React from "react";

const WorkHistory = ({ columnTitle, cardTitle, action }) => {
  return (
    <div className="work-history-section">
      <span className="work-history">
        <span className="work-history-columnTitle">[{columnTitle}]</span>
        <span className="work-history-extraText">에 </span>
        <span className="work-history-cardTitle">[{cardTitle}]</span>
        <span className="work-history-extraText">를 </span>
        <span className="work-history-action">[{action}]</span>
        <span className="work-history-extraText">하였습니다.</span>
      </span>
    </div>
  );
};

export default WorkHistory;
