import React from 'react';
import styled from 'styled-components';
import HeaderMenuButton from './HeaderMenuButton';

const StyledHeader = styled.div`
    --title-color: #010101;

    display: flex;
    align-items: center;

    padding: 0px 50px;
    height: 112px;
    width: 100%;

    .title {
        width: 175px;
        height: 46px;
        font-size: 32px;
        font-family: Noto Sans KR;

        color: var(--title-color, #000);
    }
`;

const Header = ({ title, onClickForLogVisible }) => {
    return (
        <StyledHeader>
            <div className="title">{title}</div>
            <HeaderMenuButton onClick={onClickForLogVisible} />
        </StyledHeader>
    );
};

export default Header;
