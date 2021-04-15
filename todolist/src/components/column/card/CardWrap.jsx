import React, { useRef, useState } from "react";
import Card from "./Card";
// import styled from "styled-components";
import CardForm from "./CardForm.jsx";
import CardContainer from "./CardContainer.style";

function CardWrap(props) {
  const { card, onDelete, onUpdate } = props;
  const [editMode, setEditMode] = useState(false);
  const cardContainer = useRef();

  const handleSubmit = ({ cardId, cardTitle, content }) => {
    onUpdate({ cardId, cardTitle, content });
    setEditMode(!editMode);
  };

  const handleEdit = (e) => {
    e.preventDefault();
    setEditMode(!editMode);
  };

  return (
    <CardContainer onDoubleClick={handleEdit} ref={cardContainer}>
      {editMode ? (
        <CardForm editMode={editMode} card={card} onSubmit={handleSubmit} onCancel={handleEdit} />
      ) : (
        <Card card={card} onDelete={onDelete} cardContainer={cardContainer} />
      )}
    </CardContainer>
  );
}

export default CardWrap;
