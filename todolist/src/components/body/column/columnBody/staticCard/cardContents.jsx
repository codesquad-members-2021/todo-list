import React from "react";

const CardContents = ({ cardContents }) => {
  return (
    <div className="card-contents-section">
      {cardContents.map((content, index) => (
        <div key={index} className="content">
          - {content}
        </div>
      ))}
    </div>
  );
};

export default CardContents;
