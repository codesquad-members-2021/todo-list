import React, { useEffect } from 'react';
import styled from "styled-components";
import HeaderContainer from './containers/header/HeaderContainer';

import Column from './components/Seong/Column';

const StyledAppWrapper = styled.div`
    width: 1440px;
    margin: 0 auto;
    overflow: hidden;
    position: relative;
`;

const list = [
    {
        title: '대충제목',
        body: '대충내용',
        author: 'web',
    },
    {
        title: '제목',
        body: '대충ㅇㅇㅇㅇㅇㅇㅇㅇㅇ내용',
        author: 'web',
    },
];

const App = () => {
    useEffect(() => (document.body.style = 'background: #F5F5F7;'), []);

    return (
        <StyledAppWrapper>
            <HeaderContainer />
            <Column title="Column title" list={list} />
        </StyledAppWrapper>
    );
};

export default App;
