import React, { useState } from "react";
import styled from 'styled-components';
import Button from "../Button";

const EditTodoBlock = styled.div`
  display: ${({toggle}) => toggle ? 'block' : 'none'};
`;

const Title = styled.input.attrs({
  type: 'text'
})`
  font-size: 1.2rem;
  width: 100%;
  padding-right: 1rem;
  font-weight: 600;
  margin-bottom: 0.3rem;
`;

const Content = styled.textarea`
  border: 0;
  resize: none;
  width: 100%;
  overflow-y: visible;
  height: 3rem;
  font-size: 1rem;
  &:focus {
    outline: none;
  }
`;

const Buttons = styled.div`
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-gap: 0.4rem;
  margin-top: 1rem;
  button {
    border-radius: 0.2rem;
    background-color: #bbb;
    padding: 0.4rem 1rem;
    opacity: 0.6;
    position: static;
    &:last-child {
      color: #fff;
      background-color: #ffcc00;
      opacity: ${({ inputs }) => inputs.title !== '' ? 1 : 0.6};
      user-select: ${({ inputs }) => inputs.title !== '' ? 'initial' : 'none'};
      pointer-events: ${({ inputs }) => inputs.title !== '' ? 'initial' : 'none'};
      line-height: 1rem;
    }
  }
`;

const EditTodo = ({ title, content, onTextChange, toggle, onToggle }) => {
  const [inputs, setInputs] = useState({
    title,
    content
  });
  const onChange = e => {
    setInputs({...inputs, [e.target.name] : e.target.value });
  }
  return (
    <EditTodoBlock toggle={toggle}>
      <Title name="title" value={inputs.title} onChange={onChange}/>
      <Content name="content" value={inputs.content} onChange={onChange}/>
      <Buttons inputs={inputs}>
        <Button onClick={onToggle}>취소</Button>
        <Button onClick={() => onTextChange(inputs)}>수정</Button>
      </Buttons>
    </EditTodoBlock>
  );
}

export default EditTodo;