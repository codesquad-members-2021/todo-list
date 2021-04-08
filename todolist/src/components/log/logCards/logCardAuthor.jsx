import React from "react";

const LogCardAuthor = ({ user }) => {
  return (
    <div className="log-card-author-section">
      <span className="log-card-author">@{user}</span>
    </div>
  );
};

export default LogCardAuthor;
