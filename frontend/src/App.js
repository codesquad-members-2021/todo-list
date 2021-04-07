import React, { useEffect } from 'react';
import { MainWrapper } from './components/common/StyledMain';
import HeaderContainer from './containers/header/HeaderContainer';

const App = () => {
    useEffect(() => (document.body.style = 'background: #F5F5F7;'), []);

    return (
        <MainWrapper>
            <HeaderContainer />
        </MainWrapper>
    );
};

export default App;
