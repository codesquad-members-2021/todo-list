import React from "react";
import CardTitle from "./cardTitle.jsx";
import CardContents from "./cardContents.jsx";
import CardAuthor from "./cardAuthor.jsx";
import CardDeleteButton from "./cardDeleteButton.jsx";
import StaticCardStyle from "./staticCard.style";
import CardTextWrapper from "./cardTextWrapper.style";

const StaticCard = ({ cardTitle, cardContents, user }) => {
  return (
    <StaticCardStyle className="static-card">
      <CardTextWrapper>
        <CardTitle cardTitle={cardTitle} />
        <CardContents cardContents={cardContents} />
        <CardAuthor user={user} />
      </CardTextWrapper>
      <CardDeleteButton />
    </StaticCardStyle>
  );
};

export default StaticCard;
