import React from "react";
import styled from "styled-components";

const Div = styled.div`
  margin: 5px;
`;

const TodoList = ({ children, ...props }) => {
  return <Div {...props}>{children}</Div>;
};

export default TodoList;
