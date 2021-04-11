import React from 'react';
import CardTitle from './cardTitle.jsx';
import CardContents from './cardContents.jsx';
import CardAuthor from './cardAuthor.jsx';
import CardDeleteButton from './cardDeleteButton.jsx';
import StaticCardStyle from './staticCard.style';
import CardTextWrapper from './cardTextWrapper.style';

const StaticCard = () => {
  const mockData = {
    cardTitle: 'js공부',
    contents: ['curry공부', 'this공부', 'closure공부'],
    user: 'swing',
  };
  return (
    <StaticCardStyle className="static-card">
      <CardTextWrapper>
        <CardTitle cardTitle={mockData.cardTitle} />
        <CardContents contents={mockData.contents} />
        <CardAuthor user={mockData.user} />
      </CardTextWrapper>
      <CardDeleteButton />
    </StaticCardStyle>
  );
};

export default StaticCard;
