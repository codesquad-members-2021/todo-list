import React from "react";
import styled from "styled-components";

const StyledLabel = styled.label`
  display: inline-block;
  width: 20px;
  height: 20px;
  border: 1px solid #000;
  background: #f20553;
  font-size: 14px;
  color: #fff;
  border-radius: 50%;
`;

const Label = ({ children, ...props }) => (
  <StyledLabel {...props}>{children}</StyledLabel>
);

export default Label;