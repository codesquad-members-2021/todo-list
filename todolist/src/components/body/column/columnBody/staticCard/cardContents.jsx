import React from "react";

const CardContents = ({ contents }) => {
  const contentList = contents.map((v) => (
    <span className="card-contents"> - {v} </span>
  ));

  return <div className="card-contents-section">{contentList}</div>;
};

export default CardContents;
