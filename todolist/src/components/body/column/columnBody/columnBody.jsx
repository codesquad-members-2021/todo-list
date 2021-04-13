import React from "react";
import ModifyCard from "./modifyCard/modifyCard.jsx";
import StaticCard from "./staticCard/staticCard.jsx";
// import DeleteModal from "./deleteModal/deleteModal.jsx";

const ColumnBody = (props) => {
  let modifyCard;

  props.modifyCardFlag
    ? (modifyCard = <ModifyCard props={props} />)
    : (modifyCard = null);

  return (
    <>
      {modifyCard}
      {props.cards.map(({ cardTitle, cardContents }, index) => (
        <StaticCard
          key={index}
          cardTitle={cardTitle}
          cardContents={cardContents}
          user={props.user}
        />
      ))}
    </>
  );
};

export default ColumnBody;
