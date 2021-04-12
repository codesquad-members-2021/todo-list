import React from 'react';
import styled from 'styled-components';
import HeaderMenuButton from './partial/HeaderMenuButton';

const StyledHeader = styled.div`
    --title-color: #010101;

    display: flex;
    align-items: center;
    position: relative;

    padding: 0px 50px;
    height: 112px;

    border-bottom: 1px solid black; // 임시

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
