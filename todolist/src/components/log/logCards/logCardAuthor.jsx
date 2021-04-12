import React from 'react';
import LogCardAuthorStyle from './logCardAuthor.style';

const LogCardAuthor = ({ user }) => {
  return (
    <LogCardAuthorStyle className="log-card-author-section">
      <span className="log-card-author">@{user}</span>
    </LogCardAuthorStyle>
  );
};

export default LogCardAuthor;
