import React from "react";
import styled from "styled-components";

const MediumButton = styled.button`
  width: 40px;
`;

const Button = ({ children, ...props }) => (
  <MediumButton {...props}>{children}</MediumButton>
);

export default Button;