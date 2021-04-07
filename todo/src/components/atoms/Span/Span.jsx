import React from "react";
import styled from "styled-components";

const StyledSpan = styled.span`
   font-size: ${props => props.fontSize};
   font-weight:${props => props.fontWeight}
`;

const Span = ({ children, fontSize ,fontWeight}) => (
   <StyledSpan fontSize={fontSize} fontWeight={fontWeight}>{children}</StyledSpan>
);

export default Span;