import React from "react";
import styled from "styled-components";
import { HiX } from "react-icons/hi";

const CardTitle = styled.div`
  font-weight: bold;
  font-size: 16px;
  line-height: 23px;
  color: #010101;
  display: block;
`;

const CardContent = styled.span`
  font-size: 14px;
  line-height: 20px;
  color: #010101;
  height: 20px;
  margin: 8px 0px;
  over-flow: hidden;
`;

function Card(props) {
  const { card, onDelete } = props;
  return (
    <div className="card">
      <CardTitle className="card-title">{card.title}</CardTitle>
      <CardContent className="card-content">{card.content}</CardContent>
      <HiX className="button-delete" onClick={() => onDelete(card)}></HiX>
    </div>
  );
}

export default Card;
