import React from 'react';
import styled from 'styled-components'
import Icon from '../utilComponent/Icon.js'

const HeaderStyle = styled.header`
    .header{
        border: 1px solid red;
        padding-left: 30px;
    }
    .header::after {
        content: ''; clear: both; display: block;
    }
    .header > h1 {
        font-size: 25px;
        font-weight: 400;
        float: left;
    }

`

const HeaderTitle = function () {
    // const [icon, setIcon] = useState('');
    const type = "bars"
    return (
        <HeaderStyle>
            <header>
                <h1>TO-DO LIST</h1>
                <Icon type={ type } />
            </header>
        </HeaderStyle>
    );
}

export default HeaderTitle;