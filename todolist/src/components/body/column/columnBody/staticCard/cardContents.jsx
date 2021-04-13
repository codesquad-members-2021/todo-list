import React from "react";
import CardContentsStyle from "./cardContents.style";

const CardContents = ({ cardContents }) => {
  const cardContentsArr = cardContents.split("\n");
  return (
    <CardContentsStyle className="card-contents-section">
      {cardContentsArr.map((content, index) => (
        <div key={index} className="content">
          - {content}
        </div>
      ))}
    </CardContentsStyle>
  );
};

export default CardContents;
