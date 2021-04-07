import React from 'react';
import styled from 'styled-components';
import { TranslateBtn } from "../common/StyledModels";

const StyledSideLog = styled.div`
    visibility: ${(props) => (props.logHide ? 'hidden' : 'visible')};

    --background-color: #fff;

    position: absolute;
    top: 0;
    right: 0;

    width: 452px;
    height: 800px;  // 1024px
    background-color: var(--background-color, #FFF);
    box-shadow: 0px 0px 4px rgba(204, 204, 204, 0.5),
        0px 2px 4px rgba(0, 0, 0, 0.25);
    backdrop-filter: blur(4px);
`;

const StyledCloseButton = styled(TranslateBtn)`
    margin-left: auto;
`;

const StyledCloseWrapper = styled.div`
    display: flex;
    align-items: center;
    position: relative;

    height: 112px;
    padding-right: 50px;
    border-bottom: 1px solid #13d47d; // 임시
`;

const SideLog = ({ logHide, onClick }) => {
    return (
        <StyledSideLog logHide={logHide}>
            <StyledCloseWrapper>
                <StyledCloseButton onClick={onClick}>
                    <svg
                        width="12"
                        height="12"
                        viewBox="0 0 12 12"
                        fill="none"
                        xmlns="http://www.w3.org/2000/svg"
                    >
                        <path
                            d="M1.5 11.25L0.75 10.5L5.25 6L0.75 1.5L1.5 0.750004L6 5.25L10.5 0.750004L11.25 1.5L6.75 6L11.25 10.5L10.5 11.25L6 6.75L1.5 11.25Z"
                            fill="#010101"
                        />
                    </svg>
                </StyledCloseButton>
            </StyledCloseWrapper>
        </StyledSideLog>
    );
};

export default SideLog;
