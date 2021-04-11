import React from 'react';
import CardTitleStyle from './cardTitle.style';

const CardTitle = ({ cardTitle }) => {
  return (
    <div className="card-title-section">
      <CardTitleStyle className="card-title">{cardTitle}</CardTitleStyle>
    </div>
  );
};

export default CardTitle;
