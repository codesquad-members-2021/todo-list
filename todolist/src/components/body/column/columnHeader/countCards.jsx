import React from "react";
import CountCardsStyle from "./countCards.style";

const CountCards = ({ cardsNumber }) => {
  return (
    <div className="count-cards-section">
      <CountCardsStyle className="count-cards">{cardsNumber}</CountCardsStyle>
    </div>
  );
};

export default CountCards;
