import React from "react";
import styled from "styled-components";

const Wrap = styled.div`
  display: flex;
  justify-content: space-between;
  width: 600px;
`;

const TodoListWrap = ({ children, ...props }) => {
  return <Wrap {...props}>{children}</Wrap>;
};

export default TodoListWrap;
