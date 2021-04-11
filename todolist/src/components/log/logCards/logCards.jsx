import React from 'react';
import Emoji from './emoji.jsx';
import LogCardAuthor from './logCardAuthor.jsx';
import WorkHistory from './workHistory.jsx';
import HistoryTime from './historyTime.jsx';
import LogCardsStyle from './logCards.style';
import LogContentsStyle from './logContents.style';

const LogCards = ({ cardData }) => {
  return (
    <LogCardsStyle className="log-cards-section">
      <Emoji emoji={'👉'} />
      <LogContentsStyle>
        <LogCardAuthor user={cardData.user} />
        <WorkHistory columnTitle={cardData.columnTitle} cardTitle={cardData.cardTitle} action={cardData.action} />
        <HistoryTime time={'2021년'} />
      </LogContentsStyle>
    </LogCardsStyle>
  );
};

export default LogCards;
