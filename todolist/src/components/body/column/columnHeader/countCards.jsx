import React from 'react';
import CountCardsStyle from './countCards.style';

const CountCards = ({ cardsNumber }) => {
  return (
    <CountCardsStyle className="count-cards-section">
      <div className="count-cards">{cardsNumber}</div>
    </CountCardsStyle>
  );
};

export default CountCards;
