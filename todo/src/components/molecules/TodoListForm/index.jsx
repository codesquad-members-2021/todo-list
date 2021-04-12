import React from "react";
import styled from "styled-components";

const StyledForm = styled.form`
  position: relative;
  width: 308px;
  padding: 16px;
  margin: 16px;
  background: #fff;
  border-radius: 5px;
`;

const TodoList = ({
  onSubmit = e => e.preventDefault(),
  children,
  ...props
}) => (
  <StyledForm {...props} onSubmit={onSubmit} noValidate>
    {children}
  </StyledForm>
);

export default TodoList;
