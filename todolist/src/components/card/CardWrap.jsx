import React, { useState } from "react";
import Card from "./Card";
import styled from "styled-components";
import CardForm from "./CardForm.jsx";

const CardContiner = styled.li`
  background-color: #fff;
  border: 1px solid #0075de;
  border-radius: 5px;
  margin-top: 1em;
  padding: 1em;
`;

function CardWrap(props) {
  const { card, onDelete, onUpdate } = props;
  const [edit, setEdit] = useState(false);

  const handleSubmit = ({ id, title, content }) => {
    onUpdate({ id, title, content });
    setEdit(!edit);
  };

  const handleEdit = (e) => {
    e.preventDefault();
    setEdit(!edit);
  };

  return <CardContiner onDoubleClick={handleEdit}>{edit ? <CardForm card={card} onSubmit={handleSubmit} onCancel={handleEdit} /> : <Card card={card} onDelete={onDelete} />}</CardContiner>;
}

export default CardWrap;
