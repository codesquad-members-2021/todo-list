import React from 'react';
import CardContentsStyle from './cardContents.style';

const CardContents = ({ cardContents }) => {
  return (
    <CardContentsStyle className="card-contents-section">
      {cardContents.map((content, index) => (
        <div key={index} className="content">
          - {content}
        </div>
      ))}
    </CardContentsStyle>
  );
};

export default CardContents;
