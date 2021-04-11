import React from 'react';
import LogHeader from './logHeader/logHeader.jsx';
import LogCards from './logCards/logCards.jsx';
import LogStyle from './log.style';

const Log = () => {
  const mockData = {
    user: 'swing',
    columnTitle: '해야할 일',
    cardTitle: 'js공부',
    action: '등록',
  };
  return (
    <LogStyle className="log">
      <LogHeader />
      <LogCards cardData={mockData} />
    </LogStyle>
  );
};

export default Log;
