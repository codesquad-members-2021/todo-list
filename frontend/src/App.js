import React, { useEffect } from 'react';
import { MainWrapper } from './components/common/StyledMain';
import HeaderContainer from './containers/header/HeaderContainer';
import Column from './components/Seong/Column';

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
        <MainWrapper>
            <HeaderContainer />
            <Column title="Column title" list={list} />
        </MainWrapper>
    );
};

export default App;
