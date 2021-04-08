import React from "react";
import ColumnTitle from "./columnTitle.jsx";
import CountCards from "./countCards.jsx";
import AddCardButton from "./addCardButton.jsx";
import DeleteColumnButton from "./deleteColumnButton.jsx";

const ColumnHeader = () => {
  const mockData = {
    columnTitle: "해야할 일",
    cardsNumber: 2,
  };
  return (
    <div className="column-header">
      <ColumnTitle columnTitle={mockData.columnTitle} />
      <CountCards cardsNumber={mockData.cardsNumber} />
      <AddCardButton />
      <DeleteColumnButton />
    </div>
  );
};

export default ColumnHeader;
