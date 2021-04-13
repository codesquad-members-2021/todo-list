import React from "react";
import styled from "styled-components";

const StyledMainUl = styled.ul`
    display: flex;
`;

const Main = ({children}) => {
    return <StyledMainUl>{children}</StyledMainUl>
};

export default Main;