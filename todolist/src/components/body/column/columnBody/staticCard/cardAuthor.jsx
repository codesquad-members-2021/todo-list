import React from 'react';
import CardAuthorStyle from './cardAuthor.style';

const CardAuthor = ({ user }) => {
  return (
    <div className="card-author-section">
      <CardAuthorStyle className="card-author">author by {user}</CardAuthorStyle>
    </div>
  );
};

export default CardAuthor;
