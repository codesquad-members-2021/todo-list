import React from "react";
import styled from "styled-components";

const StyledForm = styled.form`
  width: ${props => props._width};
  background-color: ${props => props._backgroundColor};
  position: ${props => props._position};
  border-radius: ${props => props._borderRadius};
  padding: 10px 15px;
  margin: ${props => props._margin};
`;

const Form = ({ onSubmit = e => e.preventDefault(), children, ...props }) => (
  <StyledForm {...props} onSubmit={onSubmit} noValidate>
    {children}
  </StyledForm>
);

export default Form;
