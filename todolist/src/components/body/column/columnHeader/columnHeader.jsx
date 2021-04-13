import React from 'react';
import ColumnTitle from './columnTitle.jsx';
import CountCards from './countCards.jsx';
import AddCardButton from './addCardButton.jsx';
import DeleteColumnButton from './deleteColumnButton.jsx';
import ColumnHeaderSection from './columnHeaderSection.style.jsx';
import ColumnTitleWrapper from './ColumnTitleWrapper.style';

const ColumnHeader = ({ columnTitle, cards }) => {
  return (
    <ColumnHeaderSection className="column-header-section">
      <ColumnTitleWrapper>
        <ColumnTitle columnTitle={columnTitle} />
        <CountCards cardsNumber={cards.length} />
      </ColumnTitleWrapper>
      <AddCardButton />
      <DeleteColumnButton />
    </ColumnHeaderSection>
  );
};

export default ColumnHeader;
