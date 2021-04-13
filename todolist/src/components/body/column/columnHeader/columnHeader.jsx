import React from "react";
import ColumnTitle from "./columnTitle.jsx";
import CountCards from "./countCards.jsx";
import AddCardButton from "./addCardButton.jsx";
import DeleteColumnButton from "./deleteColumnButton.jsx";
import ColumnHeaderSection from "./columnHeaderSection.jsx";

const ColumnHeader = ({ id, columnTitle, cards, handleAddButtonClick }) => {
  const handleCardAddedColumn = ({ target: { id } }) => {
    handleAddButtonClick(id);
  };

  return (
    <ColumnHeaderSection className="column-header-section">
      <ColumnTitle columnTitle={columnTitle} />
      <CountCards cardsNumber={cards.length} />
      <AddCardButton id={id} handleCardAddedColumn={handleCardAddedColumn} />
      <DeleteColumnButton />
    </ColumnHeaderSection>
  );
};

export default ColumnHeader;
