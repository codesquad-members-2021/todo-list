import React from "react";
import styled from "styled-components"

const StyledInput= styled.input`
  width: 100px;
`;

const Input = ({ type = "text", ...props }) => <StyledInput type={type} {...props} />;

export default Input;
