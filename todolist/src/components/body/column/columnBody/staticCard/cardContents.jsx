import React from 'react';
import CardContentsStyle from './cardTitle.style';

const CardContents = ({ contents }) => {
  const contentList = contents.map(v => <CardContentsStyle className="card-contents"> - {v} </CardContentsStyle>);

  return <div className="card-contents-section">{contentList}</div>;
};

export default CardContents;
