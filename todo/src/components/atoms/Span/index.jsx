import React from "react";
import styled from "styled-components";

const StyledSpan = styled.span`
   font-size: ${props => props.fontSize};
   font-weight: ${props => props.fontWeight};
   color: ${props => props.fontColor};
`;

const Span = ({ children, ...props }) => (
   <StyledSpan {...props}>{children}</StyledSpan>
);

export default Span;