import React from "react";
import CardTitle from "./cardTitle.jsx";
import CardContents from "./cardContents.jsx";
import CardAuthor from "./cardAuthor.jsx";
import CardDeleteButton from "./cardDeleteButton.jsx";

const StaticCard = () => {
  const mockData = {
    cardTitle: "js공부",
    contents: ["curry공부", "this공부", "closure공부"],
    user: "swing",
  };
  return (
    <div className="static-card">
      <CardTitle cardTitle={mockData.cardTitle} />
      <CardContents contents={mockData.contents} />
      <CardAuthor user={mockData.user} />
      <CardDeleteButton />
    </div>
  );
};

export default StaticCard;
