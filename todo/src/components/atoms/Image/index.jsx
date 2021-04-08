import React from "react";
import styled from "styled-components";

const StyledImage = styled.img`
  width: ${props => props._width};
`;

const Image = ({ src, ...props }) => <StyledImage src={src} {...props} />;

export default Image;
