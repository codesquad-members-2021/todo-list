import React from 'react';
import styled from 'styled-components';

const Wrapper = styled.div`
    .button {
        display: flex;
        flex-direction: row;
        align-items: flex-start;
        /* padding: 10px; */

        position: absolute;
        width: 134px;
        height: 40px;
        left: 0px;
        top: 0px;

        /* Gray 5 */

        background: #e0e0e0;
        border-radius: 6px;
    }
    .button--title {
        position: absolute;
        width: 114px;
        height: 20px;
        left: 10px;
        top: 10px;

        font-family: Noto Sans KR;
        font-style: normal;
        font-weight: normal;
        font-size: 14px;
        line-height: 20px;
        text-align: center;

        /* Gray 3 */

        color: #828282;

        /* Inside Auto Layout */

        flex: none;
        order: 0;
        flex-grow: 0;
        margin: 0px 10px;
    }
`;

const ButtonNomal = ({ title }) => {
    return (
        <Wrapper>
            <div className="button">
                <div className="button--title">{title}</div>
            </div>
        </Wrapper>
    );
};

export default ButtonNomal;
