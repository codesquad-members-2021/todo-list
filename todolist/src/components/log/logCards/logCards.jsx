import React from "react";
import Emoji from "./emoji.jsx";
import LogCardAuthor from "./logCardAuthor.jsx";
import WorkHistory from "./workHistory.jsx";
import HistoryTime from "./historyTime.jsx";

const LogCards = ({ cardData }) => {
  return (
    <div className="log-cards-section">
      <Emoji emoji={"👉"} />
      <LogCardAuthor user={cardData.user} />
      <WorkHistory
        columnTitle={cardData.columnTitle}
        cardTitle={cardData.cardTitle}
        action={cardData.action}
      />
      <HistoryTime time={"2021년"} />
    </div>
  );
};

export default LogCards;
