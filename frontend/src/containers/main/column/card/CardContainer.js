import React, { useState, useEffect } from 'react';
import axios from "axios";
import Card from "../../../../components/main/column/card/Card";
import PopupModal from "../../../../components/common/PopupModal";

const CardContainer = ({ title, body, index, setCardList, columnId, cardId, previousCardId, isZanSang }) => {
    const [x, setX] = useState()
    const [y, setY] = useState()
    const [left, setLeft] = useState(0)
    const [top, setTop] = useState(0)
    const [isDown, setDown] = useState(false)

    const mouseDownHandler = (e) => {
        if (isZanSang) return;
        setX(() => e.clientX);
        setY(() => e.clientY);
        setDown(() => true);
        // setCardList((cardList) => {
        //     const left = cardList.slice(0, index+1);
        //     const right = cardList.slice(index+1);
        //     return left.concat({title, body, index, columnId, setCardList, cardId, previousCardId, isZanSang:true}, right);
        // });
    };

    const [moveX, setMoveX] = useState(0);
    const [moveY, setMoveY] = useState(0);
    useEffect(() => {
        // if(!isDown) return
        // setCardList((cardList) => cardList.filter((v) => v.isZanSang !== true))
        // setCardList((list)=>{
        //     const targetIndex = moveY + index
        //     const left = list.slice(0, targetIndex);
        //     const right = list.slice(targetIndex);
        //     return left.concat({title, body, index, setCardList, columnId, cardId, previousCardId, isZanSang:true}, right)
        // })
    }, [moveY]);

    const mouseMoveHandler = (e) => {
        if (!isDown) return;
        setLeft(() => e.clientX - x);
        setTop(() => e.clientY - y);

        setMoveX(() => Math.floor((e.clientX - x) / 348));
        setMoveY(() => Math.floor((e.clientY - y) / 104));
    };
    const mouseUpHandler = () => {
        setDown(() => false);
        setLeft(0);
        setTop(0);
        // setCardList((cardList) => cardList.filter((_, i) => i !== index))
        // setCardList((cardList) => cardList.map((v) => {
        //     return !v.isZanSang ? v : {...v, isZanSang:false}
        // }))
        //위부분 return은 axios.put으로 새로받아온 카드로
        // const card = {title, body, columnId, previousCardId, cardId}
        // const targetColumn = moveX + card.columnId
        // const targetIndex = moveY + card.index
        // setColumnData((data)=>{
        //     return [...data].map((v,i)=>{
        //         console.log(i)
        //         console.log(targetColumn)
        //         if(i!==targetColumn) return v
        //         const left = v.cards.slice(0, targetIndex);
        //         const right = v.cards.slice(targetIndex);
        //         const card2 = left.concat(card, right)
        //         console.log(v.cards)
        //         console.log(card2)
        //         return {columnId:v.columnId, name:v.name, cards:card2};

        //     })
        // })
    };

    const [isCardDelHover, setIsCardDelHover] = useState(false);
    const [isPopubVisible, setIsPopubVisible] = useState(false);

    const onClickDeleteCardHandler  = () => setIsPopubVisible(true);
    const onDoubleClickEditCardHandler = () => {
        setCardList((cardList) => {
            const left = cardList.slice(0, index);
            const right = cardList.slice(index + 1);
            return left.concat({ title, body, isInput: true, previousCardId, cardId, columnId }, right);
        });
    };

    const onMouseEnterHandler = () => setIsCardDelHover(true);
    const onMouseLeaveHandler = () => setIsCardDelHover(false);

    const data = { title, body, left, top };
    const flags = {isDown, isCardDelHover, isZanSang };
    const onEventsCard = {
        onClickDeleteCardHandler,
        onDoubleClickEditCardHandler,
        onMouseEnterHandler,
        onMouseLeaveHandler,
        mouseMoveHandler,
        mouseUpHandler,
        mouseDownHandler
    };

    // Popup Events
    // 팝업에서 확인버튼 -> 카드 삭제
    const onClickPopupConfirm = () => {
        setCardList((cardList) => cardList.filter((_, i) => i !== index))
        axios.delete(`api/columns/${columnId}/cards/${cardId}`);
        setIsPopubVisible(false);
    };
    const onClickPopupCancel = () => setIsPopubVisible(false);

    return (
        <>
            <Card data={data} flags={flags} onEvents={onEventsCard} />
            <PopupModal
                isVisible={isPopubVisible}
                cancelClickHandler={onClickPopupCancel}
                confirmClickHandler={onClickPopupConfirm}
            />
        </>
    );
};

export default CardContainer;
