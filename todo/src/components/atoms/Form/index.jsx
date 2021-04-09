import React from "react";
import styled from "styled-components";

const StyledForm = styled.form`
  position: relative;
  width: 300px;
  padding: 10px 15px;
  margin: 15px;
  background-color: #fff;
  border-radius: 5px;
`;

const Form = ({ onSubmit = e => e.preventDefault(), children, ...props }) => (
  <StyledForm {...props} onSubmit={onSubmit} noValidate>
    {children}
  </StyledForm>
);

export default Form;
