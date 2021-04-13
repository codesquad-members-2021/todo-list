import React, { useEffect } from 'react';
import styled from "styled-components";
import HeaderContainer from './containers/header/HeaderContainer';
import MainContainer from './containers/main/MainContainer';

const StyledAppWrapper = styled.div`
    width: 1440px;
    margin: 0 auto;
    overflow: hidden;
    position: relative;
`;


const App = () => {
    useEffect(() => (document.body.style = 'background: #F5F5F7;'), []);

    return (
        <StyledAppWrapper>
            <HeaderContainer />
            <MainContainer />
        </StyledAppWrapper>
    );
};

export default App;
