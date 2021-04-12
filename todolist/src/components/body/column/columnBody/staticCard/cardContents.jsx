import React from 'react';
import CardContentsStyle from './cardContents.style';

const CardContents = ({ cardContents }) => {
  return (
    <div className="card-contents-section">
      {cardContents.map((content, index) => (
        <CardContentsStyle key={index} className="content">
          - {content}
        </CardContentsStyle>
      ))}
    </div>
  );
};

export default CardContents;
