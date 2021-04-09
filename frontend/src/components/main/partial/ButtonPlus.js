import React from 'react';
import styled from 'styled-components';

const Wrapper = styled.div`
    svg {
        position: absolute;
        left: 21.27%;
        right: 21.27%;
        top: 21.27%;
        bottom: 21.27%;

        /* Gray 4 */
        fill: #bdbdbd;
    }
    svg:hover {
        /* Blue */
        fill: #0075de;
    }
`;

const ButtonPlus = () => {
    return (
        <Wrapper>
            <svg
                width="14"
                height="14"
                viewBox="0 0 14 14"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
            >
                <path d="M0.105709 7.53033L0.105709 6.46967H6.46967V0.105713H7.53033V6.46967H13.8943V7.53033H7.53033V13.8943H6.46967V7.53033H0.105709Z" />
            </svg>
        </Wrapper>
    );
};

export default ButtonPlus;
