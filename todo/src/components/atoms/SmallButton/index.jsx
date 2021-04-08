import React from "react";
import styled from "styled-components";

const SmallButton = styled.button`
  position: ${props => props._position};
  width: 40px;
  height: 40px;
  padding: 0;
  border: none;
  background: none;
  cursor: pointer;
  right: ${props => props._right};
  &:focus {
      border: none;
      outline:none;
  }
`;

const Button = ({ children, ...props }) => (
  <SmallButton {...props}>{children}</SmallButton>
);

export default Button;
