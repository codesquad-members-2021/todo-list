import React, { useState } from "react";
import styled from "styled-components";
import Button from "../../utils/Button";
import { CardButtonSection } from "./CardButton.style";
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

function CardForm({ card, editMode, onSubmit, onCancel }) {
  const [title, setTitle] = useState(card ? card.title : "");
  const [content, setContent] = useState(card ? card.content : "");

  const handelOnSubmit = (e) => {
    e.preventDefault();
    onSubmit({ id: card ? card.id : Date.now(), title, content });
  };
  return (
    <form action="">
      <CardFormSection>
        <CardFormTitle
          type="text"
          placeholder="제목을 입력하세요.."
          value={title}
          onChange={(e) => setTitle(e.target.value)}
        />
        <CardFormContent
          placeholder="내용을 입력하세요.."
          onChange={(e) => setContent(e.target.value)}
          defaultValue={content}
        ></CardFormContent>
      </CardFormSection>
      <CardButtonSection>
        <Button type="cancel" onClick={onCancel}>
          취소
        </Button>
        <Button
          type={editMode ? "edit" : "enroll"}
          onClick={handelOnSubmit}
        ></Button>
      </CardButtonSection>
    </form>
  );
}

export default CardForm;
