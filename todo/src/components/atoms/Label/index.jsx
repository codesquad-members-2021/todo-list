import React from "react";
import styled from "styled-components";

const StyledLabel = styled.label`
  display:flex;
  width: 30px;
  height: 30px;
  border: 1px solid #000;
  margin: 0px 7px;
  background: #f20553;
  color: #fff;
  font-size: 14px;
  font-weight:700;
  border-radius: 50%;
  place-items: center;
  place-content: center;
`;

const Label = ({ children, ...props }) => (
  <StyledLabel {...props}>{children}</StyledLabel>
);

export default Label;