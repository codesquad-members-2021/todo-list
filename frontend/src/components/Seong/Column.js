import React, { useState } from 'react';
import styled from 'styled-components';
import Card from './Card';
import ButtonDelete from './ButtonDelete';
import ButtonPlus from './ButtonPlus';
import CardInput from './CardInput';

const ColumnWrapper = styled.div`
    .column {
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
        padding: 0px 8px;

        position: relative;
        width: 308px;
        height: 26px;
    }
    .column__text {
        display: flex;
        flex-direction: row;
        align-items: center;
        padding: 0px;

        position: absolute;
        width: 228px;
        height: 26px;
        left: 8px;
        top: 0px;
    }
    .column__text--title {
        position: absolute;
        width: 114px;
        height: 26px;
        left: 0px;
        top: 0px;

        font-family: Noto Sans KR;
        font-style: normal;
        font-weight: bold;
        font-size: 18px;
        line-height: 26px;
        /* identical to box height */

        display: flex;
        align-items: center;
    }
    .column__text--count {
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
        padding: 0px;

        position: absolute;
        width: 26px;
        height: 26px;
        left: 122px;
        top: 0px;

        /* Gray 4 */

        background: #bdbdbd;
        border-radius: 20px;

        font-family: Noto Sans KR;
        font-style: normal;
        font-weight: bold;
        font-size: 14px;
        line-height: 20px;
        display: flex;
        align-items: center;
        text-align: center;

        /* Black */

        color: #010101;
    }
    .column__plus-button {
        position: absolute;
        width: 24px;
        height: 24px;
        left: 249px;
        top: 1px;
    }
    .column__delete-button {
        position: absolute;
        width: 24px;
        height: 24px;
        left: 282px;
        top: 1px;
    }
`;

const Column = ({ title, list }) => {
    const [isInProgress, setProgress] = useState(false);
    //prettier-ignore
    const renderCard = (v, i) => {
        v.index = i;
        v.list = list;
        v.clickHandler = reRender;
        v.dbClickHandler = editEvent;
        return (<li key={i}><Card {...v} /></li>);
    };

    const reRender = () => {
        setCardList(list.map(renderCard));
        setProgress(false);
    };

    const plusEvent = () => {
        console.log(cardList)
        if (isInProgress) return;
        setCardList([
            <li key="input">
                <CardInput list={list} index={0} clickHandler={reRender} />
            </li>,
            ...cardList,
        ]);
        setProgress(true);
    };

    const editEvent = (index, card) => {
        if (isInProgress) return;
        setCardList((cardList) => {
            cardList.splice(
                index,
                1,
                <li key={index}>
                    <CardInput
                        list={list}
                        index={index}
                        isModify={true}
                        clickHandler={reRender}
                        originCard={card}
                    />
                </li>,
            );
            return [...cardList];
        });
        setProgress(true);
    };

    const [cardList, setCardList] = useState(list.map(renderCard));

    return (
        <ColumnWrapper>
            <div className="column">
                <span className="column__text">
                    <span className="column__text--title">{title}</span>
                    <span className="column__text--count">
                        {cardList.length}
                    </span>
                </span>
                <div onClick={plusEvent} className="column__plus-button">
                    <ButtonPlus />
                </div>
                <div className="column__delete-button">
                    <ButtonDelete />
                </div>
            </div>
            <ul>{cardList}</ul>
        </ColumnWrapper>
    );
};

export default Column;
