import React from "react";
import styled from "styled-components";
import IconButton from "../../utils/IconButton";

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

const CardItem = styled.div`
  display: flex;
  justify-content: space-between;
`;

const CardSection = styled.span`
  display: flex;
  flex-direction: column;
`;

function Card(props) {
  const { card, onDelete } = props;
  return (
    <CardItem>
      <CardSection>
        <CardTitle className="card-title">{card.title}</CardTitle>
        <CardContent className="card-content">{card.content}</CardContent>
      </CardSection>
      <CardSection>
        <IconButton type="delete" cb={() => onDelete(card)}></IconButton>
      </CardSection>
    </CardItem>
  );
}

export default Card;
