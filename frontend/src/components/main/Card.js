import React from 'react';
import styled from 'styled-components';
import ButtonDelete from './partial/ButtonDelete'

const CardWrapper = styled.div`
    .card {
        display: flex;
        flex-direction: row;
        align-items: flex-start;
        padding: 16px;

        position: relative;
        width: 308px;
        height: 108px;

        /* White */

        background: #ffffff;
        /* nomal */
        border:1px solid red;

        box-shadow: 0px 1px 30px rgba(224, 224, 224, 0.3);
        border-radius: 6px;

        margin-top:20px;
        margin-left:20px;
    }
    .card__text {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        padding: 0px;

        position: absolute;
        width: 252px;
        height: 76px;
        left: 16px;
        top: 16px;

        border-radius: 8px;

        /* Inside Auto Layout */

        flex: none;
        order: 0;
        flex-grow: 0;
        margin: 0px 0px;
    }
    .card__text--title {
        position: absolute;
        width: 252px;
        height: 23px;
        left: 0px;
        top: 0px;

        font-family: Noto Sans KR;
        font-style: normal;
        font-weight: bold;
        font-size: 16px;
        line-height: 23px;

        /* Black */

        color: #010101;

        /* Inside Auto Layout */

        flex: none;
        order: 0;
        flex-grow: 0;
        margin: 8px 0px;
    }
    .card__text--body {
        position: absolute;
        width: 252px;
        height: 20px;
        left: 0px;
        top: 31px;

        font-family: Noto Sans KR;
        font-style: normal;
        font-weight: normal;
        font-size: 14px;
        line-height: 20px;

        /* Black */

        color: #010101;

        /* Inside Auto Layout */

        flex: none;
        order: 1;
        flex-grow: 0;
        margin: 8px 0px;
    }
    .card__text--author {
        position: absolute;
        width: 252px;
        height: 17px;
        left: 0px;
        top: 59px;

        font-family: Noto Sans KR;
        font-style: normal;
        font-weight: normal;
        font-size: 12px;
        line-height: 17px;

        /* Gray 4 */

        color: #bdbdbd;

        /* Inside Auto Layout */

        flex: none;
        order: 2;
        flex-grow: 0;
        margin: 8px 0px;
    }
    .card__delete-button {
        position: absolute;
        width: 24px;
        height: 24px;
        left: 268px;
        top: 16px;

        /* Inside Auto Layout */

        flex: none;
        order: 1;
        flex-grow: 0;
        margin: 0px 0px;
    }
`;

const Card = ({ title, body, author, index, list, clickHandler, dbClickHandler }) => {

    const deleteEvent = () => {
        list.splice(index, 1)
        clickHandler()
    }
    const dbClickEvent = () => dbClickHandler(index, {title, body})

    return (
        <CardWrapper>
            <div className="card" onDoubleClick={dbClickEvent}>
                <div className="card__text">
                    <div className="card__text--title">{title}</div>
                    <div className="card__text--body">{body}</div>
                    <div className="card__text--author">author by {author}</div>
                </div>
                <div onClick={deleteEvent} className="card__delete-button"><ButtonDelete /></div>
            </div>
        </CardWrapper>
    );
};

export default Card;
