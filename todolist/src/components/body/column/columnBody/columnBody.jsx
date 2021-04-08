import React from "react";
import DeleteModal from "./deleteModal/deleteModal.jsx";
import ModifyCard from "./modifyCard/modifyCard.jsx";
import StaticCard from "./staticCard/staticCard.jsx";

const ColumnBody = ({ cards }) => {
  const mockData = { cards: ["card1", "card2", "card3", "card4"] };
  const cardList = mockData.cards.map((v) => (
    <div key={v} className="card">
      {v}
    </div>
  ));
  return <div className="column-body-section">{cardList}</div>;
};

export default ColumnBody;
