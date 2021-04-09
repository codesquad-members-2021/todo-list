import React from "react";
import styled from "styled-components";

const Div = styled.div`
  display: inline-block;
  margin: 10px;
  outline: black solid;
`;

const TodoList = ({ children, ...props }) => {
  return <Div {...props}>{children}</Div>;
};

export default TodoList;
