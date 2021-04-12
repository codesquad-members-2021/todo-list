import React from "react";
import WorkHistoryStyle from './workHistory.style';

const WorkHistory = ({ columnTitle, cardTitle, action }) => {
  return (
    <div className="work-history-section">
      <WorkHistoryStyle className="work-history">
        <span className="work-history-columnTitle">[{columnTitle}]</span>
        <span className="work-history-extraText">에 </span>
        <span className="work-history-cardTitle">[{cardTitle}]</span>
        <span className="work-history-extraText">를 </span>
        <span className="work-history-action">[{action}]</span>
        <span className="work-history-extraText">하였습니다.</span>
      </WorkHistoryStyle>
    </div>
  );
};

export default WorkHistory;
