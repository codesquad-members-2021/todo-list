import React, { useState } from "react";
import styled from "styled-components";
import Button from "../../utils/Button";
import { CardButtonSection } from "./CardButtonSection.style";

function CardForm({ card, editMode, onSubmit, onCancel }) {
  const [cardTitle, setTitle] = useState(card ? card.cardTitle : "");
  const [content, setContent] = useState(card ? card.content : "");

  const handelOnSubmit = (e) => {
    e.preventDefault();
    onSubmit({ cardId: card ? card.cardId : Date.now(), cardTitle, content });
  };
  return (
    <form action="">
      <CardFormSection>
        <CardFormTitle
          type="text"
          placeholder="제목을 입력하세요.."
          value={cardTitle}
          onChange={(e) => setTitle(e.target.value)}
        />
        <CardFormContent
          placeholder="내용을 입력하세요.."
          onChange={(e) => setContent(e.target.value)}
          defaultValue={content}
        ></CardFormContent>
      </CardFormSection>
      <CardButtonSection>
        <Button type="cancel" subType="cancel" onClick={onCancel} />
        <Button type={editMode ? "edit" : "enroll"} subType={editMode ? "edit" : "enroll"} onClick={handelOnSubmit} />
      </CardButtonSection>
    </form>
  );
}

const CardFormSection = styled.div`
  display: flex;
  flex-direction: column;
`;

const CardFormTitle = styled.input`
  border: none;
  width: 100%;
  height: 23px;
  background-color: #ddd;
`;

const CardFormContent = styled.textarea`
  margin-top: 10px;
  min-height: 100px;
  width: auto;
`;

export default CardForm;
