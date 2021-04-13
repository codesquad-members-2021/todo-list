import React from "react";
import styled from "styled-components";
import Button from "../Button";

const CreateTodoBlock = styled.div`
`;

const InputTitle = styled.input.attrs({
  type: "text"
})`

`;

const InputContent = styled.input.attrs({
  type: "text"
})`

`;

const Buttons = styled.div`
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