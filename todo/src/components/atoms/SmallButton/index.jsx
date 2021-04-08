import React from "react";
import styled from "styled-components";

const SmallButton = styled.button`
  width: 34px;
  height:34px;
  padding:0;
  border:none;
  background:none;
  cursor: pointer;
  &:focus {
      border: none;
      outline:none;
    }
`;

const Button = ({ children, ...props }) => (
  <SmallButton {...props}>{children}</SmallButton>
);

export default Button;