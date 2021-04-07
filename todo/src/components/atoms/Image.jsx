import React from 'react';
import styled from "styled-components"

const StyledImage = styled.img`
    width:${props => props.width};
`;

const Image = props => (
    <StyledImage src={props.src} width={props.width}/>
);

export default Image;