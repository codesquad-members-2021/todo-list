import React from "react";
// import DeleteModal from "./deleteModal/deleteModal.jsx";
// import ModifyCard from "./modifyCard/modifyCard.jsx";
import StaticCard from "./staticCard/staticCard.jsx";

const ColumnBody = ({ cards, user }) => {
  return (
    <>
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
