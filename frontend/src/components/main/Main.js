import React from "react";
import styled from "styled-components";

const StyledMainUl = styled.ul`
    display: flex;
    padding: 0 50px;
`;

const Main = ({children}) => {
    return <StyledMainUl>{children}</StyledMainUl>
};

export default Main;