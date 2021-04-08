import React from "react";
import styled from "styled-components";

const SmallButton = styled.button`
  width: 40px;
  height: 40px;
  padding: 0;
  border: none;
  background: none;
  cursor: pointer;
  position: ${props => props._position};
  right: ${props => props._right};
`;

const Button = ({ children, ...props }) => (
  <SmallButton {...props}>{children}</SmallButton>
);

export default Button;
