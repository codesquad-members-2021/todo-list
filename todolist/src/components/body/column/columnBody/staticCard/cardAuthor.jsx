import React from "react";

const CardAuthor = ({ user }) => {
  return (
    <div className="card-author-section">
      <span className="card-author">author by {user}</span>
    </div>
  );
};

export default CardAuthor;
