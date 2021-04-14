import React from 'react';
import styled, { css } from 'styled-components';
import { TranslateBtn } from "./CommonStyledComponent";

const StyledAccentButton = styled(TranslateBtn)`
    --blue-color: #0075de;
    --dark-blue-color: #00529b;
    --white-color: #fff;
    --light-blue-color: #86c6ff;

    ${(props) =>
        props.isAble
            ? css`
                  background-color: var(--blue-color);
                  &:hover {
                      background-color: var(--dark-blue-color);
                  }
              `
            : css`
                  background-color: var(--light-blue-color);
                  cursor: not-allowed;
              `}

    color: var(--white-color);
    border-radius: 6px;

    font-family: Noto Sans KR;
    font-weight: 600;
    font-size: 14px;
    text-align: center;

    width: 134px;
    height: 40px;
    border-radius: 6px;
`;

const AccentButton = ({ children, clickHandler, isAble }) => {
    return (
        <StyledAccentButton
            onClick={clickHandler}
            isAble={isAble}
        >
            {children}
        </StyledAccentButton>
    );
};

export default AccentButton;
