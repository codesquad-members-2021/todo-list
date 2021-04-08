import React from 'react';
import styled from 'styled-components';
import MenuButton from './MenuButton';
import SideLog from './SideLog';

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

    .menu {
        margin-left: auto;
    }
`;

const HeaderTemplate = ({ title, logHide, onClickForLogVisible }) => {
    return (
        <StyledHeader>
            <div className="title">{title}</div>
            <div className="menu">
                <MenuButton onClick={onClickForLogVisible} />
                <SideLog logHide={logHide} onClick={onClickForLogVisible} />
            </div>
        </StyledHeader>
    );
};

export default HeaderTemplate;
