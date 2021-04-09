import React, { useState } from 'react';
import Card from "../../components/main/Card";
import CardInput from "../../components/main/CardInput";
import Column from "../../components/main/Column";

const ColumnContainer = ({ title, list } /* {...props} */) => {
    const [isInProgress, setProgress] = useState(false);
    //prettier-ignore
    const renderCard = (v, i) => {
        v.index = i;
        v.list = list;
        v.clickHandler = reRender;
        v.dbClickHandler = editEvent;
        return (<li key={i}><Card {...v} /></li>);
    };

    // usestate -> useeffect, callback, memo -> event

    const reRender = () => {
        setCardList(list.map(renderCard));
        setProgress(false);
    };

    const plusEvent = () => {
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
        <Column title={title} cardList={cardList} plusEvent={plusEvent} />
    );
};

export default ColumnContainer;
