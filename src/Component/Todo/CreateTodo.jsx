import React from "react";
import styled from "styled-components";
import Button from "../Button";

const CreateTodoBlock = styled.div`
  background-color: #fff;
  border: 1px solid #ffcc00;
  border-radius: 0.3rem;
  padding: 0.8rem;
`;

const InputTitle = styled.input.attrs({
  type: "text"
})`
  width: 100%;
  font-size: 1rem;
  font-weight: 600;
`;

const InputContent = styled.input.attrs({
  type: "text"
})`
  width: 100%;
  margin-bottom: 0.7rem;
`;

const Buttons = styled.div`
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-gap: 0.4rem;
  button {
    border-radius: 0.2rem;
    background-color: #bbb;
    padding: 0.4rem 1rem;
    opacity: 0.6;
    &:last-child {
      color: #fff;
      background-color: #ffcc00;
    }
  }
`;


const CreateTodo = () => {
  return (
    <CreateTodoBlock>
      <InputTitle placeholder="제목을 입력하세요"></InputTitle>
      <InputContent placeholder="내용을 입력하세요"></InputContent>
      <Buttons>
        <Button>취소</Button>
        <Button>등록</Button>
      </Buttons>
    </CreateTodoBlock>
  )
}

export default CreateTodo;