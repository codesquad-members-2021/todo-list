import React from 'react';
import Emoji from './emoji.jsx';
import LogCardAuthor from './logCardAuthor.jsx';
import WorkHistory from './workHistory.jsx';
import HistoryTime from './historyTime.jsx';
import LogCardsStyle from './logCards.style';
import LogContentsStyle from './logContents.style';

const LogCards = ({ logData, time }) => {
  return (
    <LogCardsStyle className="log-cards-section">
      <Emoji emoji={'👉'} />
      <LogContentsStyle>
        <LogCardAuthor user={logData.user} />
        <WorkHistory columnTitle={logData.columnTitle} cardTitle={logData.cardTitle} action={logData.action} />
        <HistoryTime time={time} />
      </LogContentsStyle>
    </LogCardsStyle>
  );
};

export default LogCards;
