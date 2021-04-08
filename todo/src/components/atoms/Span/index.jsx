import React from "react";
import styled from "styled-components";

const StyledSpan = styled.span`
  font-size: ${props => props._fontSize};
  font-weight: ${props => props._fontWeight};
  color: ${props => props._color};
  display: ${props => props._display};
  margin: ${props => props._margin};
  padding: ${props => props._padding};
`;

const Span = ({ children, ...props }) => (
  <StyledSpan {...props}>{children}</StyledSpan>
);

export default Span;
