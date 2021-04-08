import React from "react";

const ColumnTitle = ({ columnTitle }) => {
  return (
    <div className="column-title-section">
      <span className="column-title">{columnTitle}</span>
    </div>
  );
};

export default ColumnTitle;
