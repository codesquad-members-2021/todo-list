import React from 'react';
import styled from "styled-components";

const StyledImage = styled.img`
    width:${props => props.imgWidth};
`;

const Image = ({src, imgWidth}) => (
    <StyledImage src={src} imgWidth={imgWidth} />
);

export default Image;