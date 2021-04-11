import React from "react";
import Emoji from "./emoji.jsx";
import LogCardAuthor from "./logCardAuthor.jsx";
import WorkHistory from "./workHistory.jsx";
import HistoryTime from "./historyTime.jsx";

const LogCards = ({ logData, time }) => {
  return (
    <div className="log-cards-section">
      <Emoji emoji={"👉"} />
      <LogCardAuthor user={logData.user} />
      <WorkHistory
        columnTitle={logData.columnTitle}
        cardTitle={logData.cardTitle}
        action={logData.action}
      />
      <HistoryTime time={time} />
    </div>
  );
};

export default LogCards;
