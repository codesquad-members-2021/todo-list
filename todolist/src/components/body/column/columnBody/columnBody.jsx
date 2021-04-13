import React from "react";
import ModifyCard from "./modifyCard/modifyCard.jsx";
import StaticCard from "./staticCard/staticCard.jsx";
// import DeleteModal from "./deleteModal/deleteModal.jsx";

const ColumnBody = ({ modifyCardFlag, columnTitle, cards, user }) => {
  let modifyCard;
  console.log(columnTitle);

  modifyCardFlag
    ? (modifyCard = <ModifyCard cardTitle={cards.title} />)
    : (modifyCard = null);

  return (
    <>
      {modifyCard}
      {cards.map(({ cardTitle, cardContents }, index) => (
        <StaticCard
          key={index}
          cardTitle={cardTitle}
          cardContents={cardContents}
          user={user}
        />
      ))}
    </>
  );
};

export default ColumnBody;
