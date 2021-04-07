import React from "react";
import styled from "styled-components"

const SmallButton = styled.button`
  width: 25px;
`;

const Button = ({ children, ...props }) => (
  <SmallButton {...props}>{children}</SmallButton>
);


export default Button;
