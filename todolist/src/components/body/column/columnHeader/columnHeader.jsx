import React from "react";
import ColumnTitle from "./columnTitle.jsx";
import CountCards from "./countCards.jsx";
import AddCardButton from "./addCardButton.jsx";
import DeleteColumnButton from "./deleteColumnButton.jsx";

const ColumnHeader = ({ columnTitle, cards }) => {
  return (
    <div className="column-header-section">
      <ColumnTitle columnTitle={columnTitle} />
      <CountCards cardsNumber={cards.length} />
      <AddCardButton />
      <DeleteColumnButton />
    </div>
  );
};

export default ColumnHeader;
