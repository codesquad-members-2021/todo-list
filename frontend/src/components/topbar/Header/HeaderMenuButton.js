import React from 'react';
import styled from "styled-components";
import { TranslateBtn } from "../../common/CommonStyledComponent";

const StyledMenuButton = styled(TranslateBtn)`
    margin-left: auto;
`;

const MenuButton = ({ onClick }) => {
    return (
        <StyledMenuButton onClick={onClick}>
            <svg
                width="17"
                height="11"
                viewBox="0 0 17 11"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
            >
                <path
                    d="M0 1V3.8147e-06H17V1H0ZM17 5V6H0V5H17ZM0 10H17V11H0V10Z"
                    fill="#010101"
                />
            </svg>
        </StyledMenuButton>
    );
};

export default MenuButton;
