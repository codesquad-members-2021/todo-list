import React from "react";
import CardTitle from "./cardTitle.jsx";
import CardContents from "./cardContents.jsx";
import CardAuthor from "./cardAuthor.jsx";
import CardDeleteButton from "./cardDeleteButton.jsx";

const StaticCard = ({ cardTitle, cardContents, user }) => {
  return (
    <div className="static-card">
      <CardTitle cardTitle={cardTitle} />
      <CardContents cardContents={cardContents} />
      <CardAuthor user={user} />
      <CardDeleteButton />
    </div>
  );
};

export default StaticCard;
