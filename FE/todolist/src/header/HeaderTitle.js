import React from 'react';
import styled from 'styled-components'
import Icon from '../utilComponent/Icon.js'

const HeaderStyle = styled.header`
    .header{
        padding: 0 50px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .header > h1 {
        font-size: 25px;
        font-weight: 400;
    }`

const HeaderTitle = function () {
    // const [icon, setIcon] = useState('');
    const type = "bars"
    return (
        <HeaderStyle>
        <header className="header">
            <h1>TO-DO LIST</h1>
            <Icon type={ type } />
        </header>
        </HeaderStyle>
    );
}

export default HeaderTitle;