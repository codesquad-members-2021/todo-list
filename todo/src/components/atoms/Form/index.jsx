import React from "react";
import styled from "styled-components";

const StyledForm = styled.form`
  position: ${props => props._position};
  width: ${props => props._width};
  padding: 10px 15px;
  margin: ${props => props._margin};
  background-color: ${props => props._backgroundColor};
  border-radius: ${props => props._borderRadius};
`;

const Form = ({ onSubmit = e => e.preventDefault(), children, ...props }) => (
  <StyledForm {...props} onSubmit={onSubmit} noValidate>
    {children}
  </StyledForm>
);

export default Form;
