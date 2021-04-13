import React from "react";
import styled from "styled-components";
import Span from "../../atoms/Span";
import Label from "../../atoms/Label";
import ButtonList from "../../atoms/Buttons/ButtonList";

const WrapDiv = styled.div`
  display: flex;
  padding: 10px;
  margin: 10px 0px 10px 10px;
  place-items: center;
  justify-content: space-between;
`;

const LeftDiv = styled.div`
  display: flex;
  place-items: center;
`;

const TodoTitle = ({ children, itemCount }) => (
  <WrapDiv>
    <LeftDiv>
      <Span _fontSize="20px" _fontWeight="700">
        {children}
      </Span>
      <Label>{itemCount}</Label>
    </LeftDiv>
    <div>
      <ButtonList isIcon={true} addTodo={props.addTodo}></ButtonList>
    </div>
  </WrapDiv>
);

export default TodoTitle;
