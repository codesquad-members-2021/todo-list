import React from "react";
import styled from "styled-components";

const StyledSpan = styled.span`
  display: ${props => props._display};
  color: ${props => props._color};
  margin: ${props => props._margin};
  font-size: ${props => props._fontSize};
  font-weight: ${props => props._fontWeight};
`;

const Span = ({ children, ...props }) => (
  <StyledSpan {...props}>{children}</StyledSpan>
);

export default Span;
