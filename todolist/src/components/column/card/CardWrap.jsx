import React, { useState } from "react";
import Card from "./Card";
import CardForm from "./CardForm.jsx";
import CardContainer from "./CardContainer.style";

function CardWrap(props) {
  const { card, onDelete, onUpdate } = props;
  const [editMode, setEditMode] = useState(false);

  const handleSubmit = ({ id, title, content }) => {
    onUpdate({ id, title, content });
    setEditMode(!editMode);
  };

  const handleEdit = (e) => {
    e.preventDefault();
    setEditMode(!editMode);
  };

  return (
    <CardContainer onDoubleClick={handleEdit}>
      {editMode ? (
        <CardForm card={card} onSubmit={handleSubmit} onCancel={handleEdit} />
      ) : (
        <Card card={card} onDelete={onDelete} />
      )}
    </CardContainer>
  );
}

export default CardWrap;
