import React from "react";

const CardTitle = ({ cardTitle }) => {
  return (
    <div className="card-title-section">
      <span className="card-title">{cardTitle}</span>
    </div>
  );
};

export default CardTitle;
