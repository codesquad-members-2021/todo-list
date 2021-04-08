import React from "react";
import styled from "styled-components";

const Div = styled.div`
  display: inline-block;
  outline: black solid;
  margin: 10px;
`;

const TodoList = ({ children, ...props }) => {
  return <Div {...props}>{children}</Div>;
};

export default TodoList;
