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
        left: 142px;
        top: 0px;

        /* Blue */

        background: #0075de;
        border-radius: 6px;

        /* White */

        color: #ffffff;
    }
    .button:hover {
        /* Dark Blue */

        background: #00529b;
    }
    .button-disabled {
        display: flex;
        flex-direction: row;
        align-items: flex-start;
        /* padding: 10px; */

        position: absolute;
        width: 134px;
        height: 40px;
        left: 142px;
        top: 0px;

        /* Light Blue */

        background: #86c6ff;
        border-radius: 6px;

        color: rgba(255, 255, 255, 0.4);
    }
    .button--title {
        position: absolute;
        width: 114px;
        height: 20px;
        left: 10px;
        top: 10px;

        font-family: Noto Sans KR;
        font-style: normal;
        font-weight: bold;
        font-size: 14px;
        line-height: 20px;
        text-align: center;

        /* Inside Auto Layout */

        flex: none;
        order: 0;
        flex-grow: 0;
        margin: 0px 10px;
    }
`;

const ButtonAccent = ({ title, clickHandler, isAble }) => {
    return (
        <Wrapper>
            <div
                onClick={clickHandler}
                className={isAble ? 'button' : 'button-disabled'}
            >
                <div className="button--title">{title}</div>
            </div>
        </Wrapper>
    );
};

export default ButtonAccent;
