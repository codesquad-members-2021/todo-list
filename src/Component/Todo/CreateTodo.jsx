import React, { useState } from "react";
import styled from "styled-components";
import Button from "../Button";

const CreateTodoBlock = styled.div`
  background-color: #fff;
  border: 1px solid #ffcc00;
  border-radius: 0.3rem;
  padding: 0.8rem;
  display: ${({ toggle }) => toggle ? 'block' : 'none'};
`;

const InputTitle = styled.input.attrs({
  type: "text"
})`
  width: 100%;
  font-size: 1rem;
  font-weight: 600;
  margin-bottom: 0.3rem;
`;

const InputContent = styled.textarea`
  width: 100%;
  resize: none;
  border: 0;
  height: 3rem;
  overflow-y: visible;
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
      opacity: ${({ inputs }) => inputs.title !== '' ? 1 : 0.6};
      user-select: ${({ inputs }) => inputs.title !== '' ? 'initial' : 'none'};
      pointer-events: ${({ inputs }) => inputs.title !== '' ? 'initial' : 'none'};
    }
  }
`;

const CreateTodo = ({onSubmit, toggle, setToggle}) => {
  const [inputs, setInputs] = useState({
    title: '',
    content: ''
  })
  const onCreate = () => {
    onSubmit(inputs)
    setInputs({ title: '', content: '' });
  }
  const onChange = target => {
    setInputs({ ...inputs, [target.name]: target.value });
  }
  const onCancel = () => {
    setToggle(!toggle);
    setInputs({ title: '', content: '' });
  }
  return (
    <CreateTodoBlock toggle={toggle}>
      <InputTitle autoComplete="off" name="title" value={inputs.title} onChange={({ target }) => onChange(target)} placeholder="제목을 입력하세요"></InputTitle>
      <InputContent autoComplete="off" name="content" value={inputs.content} onChange={({ target }) => onChange(target)} placeholder="내용을 입력하세요"></InputContent>
      <Buttons inputs={inputs}>
        <Button onClick={onCancel}>취소</Button>
        <Button onClick={onCreate}>등록</Button>
      </Buttons>
    </CreateTodoBlock>
  )
}

export default CreateTodo;