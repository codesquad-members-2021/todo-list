import React from 'react';
import ColumnTitleStyle from './columnTitle.style';

const ColumnTitle = ({ columnTitle }) => {
  return (
    <div className="column-title-section">
      <ColumnTitleStyle className="column-title">{columnTitle}</ColumnTitleStyle>
    </div>
  );
};

export default ColumnTitle;
