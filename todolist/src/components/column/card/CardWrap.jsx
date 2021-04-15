import React, { useRef, useState } from "react";
import Card from "./Card";
// import styled from "styled-components";
import CardForm from "./CardForm.jsx";
import CardContainer from "./CardContainer.style";
import { Draggable } from "react-beautiful-dnd";
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
  const { id, index } = props;
  return (
    <Draggable draggableId={String(id)} index={index}>
      {(provided) => (
        <div
          ref={provided.innerRef}
          {...provided.draggableProps}
          {...provided.dragHandleProps}
        >
          <CardContainer onDoubleClick={handleEdit} ref={cardContainer}>
            {editMode ? (
              <CardForm
                editMode={editMode}
                card={card}
                onSubmit={handleSubmit}
                onCancel={handleEdit}
              />
            ) : (
              <Card
                card={card}
                onDelete={onDelete}
                cardContainer={cardContainer}
              />
            )}
          </CardContainer>
        </div>
      )}
    </Draggable>
  );
}

export default CardWrap;
