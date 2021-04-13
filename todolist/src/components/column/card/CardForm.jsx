import React, { useState } from "react";
import styled from "styled-components";

const CardFormSection = styled.div`
  display: flex;
  flex-direction: column;
`;

const CardFormTitle = styled.input`
  border: none;
  width: 100%
  height: 23px;
  background-color: #ddd;
`;

const CardFormContent = styled.textarea`
  margin-top: 10px;
  min-height: 100px;
  width: auto;
`;

const CardButtonSection = styled.div`
  display: flex;
  justify-content: center;
  margin-top: 1em;
`;

const CardButton = styled.button`
  cursor: pointer;
  padding: 10px;
  width: 134px;
  height: 40px;
  background: ${(props) => props.backgroundColor || "#0075de"};
  color: ${(props) => props.fontColor || "#000"};
  border-radius: 6px;
  border: none;
  margin: 0px 4px;
`;

function CardForm(props) {
  const { card } = props;
  const [title, setTitle] = useState(card ? card.title : "");
  const [content, setContent] = useState(card ? card.content : "");

  const onSubmit = (e) => {
    e.preventDefault();
    props.onSubmit({ id: card ? card.id : Date.now(), title, content });
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
        <CardButton backgroundColor="#e0e0e0" onClick={props.onCancel}>
          취소
        </CardButton>
        <CardButton fontColor="#fff" onClick={onSubmit}>
          등록
        </CardButton>
      </CardButtonSection>
    </form>
  );
}

export default CardForm;
