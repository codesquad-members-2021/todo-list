import React from "react";

const CountCards = ({ cardsNumber }) => {
  return (
    <div className="count-cards-section">
      <span className="count-cards">{cardsNumber}</span>
    </div>
  );
};

export default CountCards;
