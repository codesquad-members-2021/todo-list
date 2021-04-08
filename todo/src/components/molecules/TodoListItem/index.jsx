import React from "react";
import styled from "styled-components";
import SmallButton from "../../atoms/SmallButton";
import Image from "../../atoms/Image";
import Form from "../../atoms/Form";
import Span from "../../atoms/Span";
import CancelBtn from "../../../images/cancelButton.svg";
const MyForm = styled.form`
  background-color: red;
`;

const MySpan = styled.span`
  color: blue;
`;

const TodoListItem = () => {
  return (
    <MyForm>
      <SmallButton>
        <Image src={CancelBtn} imgWidth="15px" />
      </SmallButton>
      <Span fontSize="20px">GitHub 공부하기</Span>
      <MySpan>add, commit, push</MySpan>
      <Span>author by Daisy</Span>
    </MyForm>
  );
};

export default TodoListItem;
