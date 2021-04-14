import React from 'react';
import styled from 'styled-components';
import { TranslateBtn } from './CommonStyledComponent';

const StyledNormalButton = styled(TranslateBtn)`
    --gray-color: #828282;
    --white-color: #fff;

    font-family: Noto Sans KR;
    font-weight: normal;
    font-size: 14px;

    width: 134px;
    height: 40px;
    background: #e0e0e0;
    border-radius: 6px;
    color: var(--gray-color);

    &:hover {
        background: var(--gray-color);
        color: var(--white-color);
    }
`;

const NormalButton = ({ children, clickHandler }) => {
    return (
        <StyledNormalButton onClick={clickHandler && clickHandler}>
            {children}
        </StyledNormalButton>
    );
};

export default NormalButton;
