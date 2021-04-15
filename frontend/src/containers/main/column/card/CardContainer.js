import React, { useState, useEffect, useRef } from 'react';
import axios from "axios";
import Card from "../../../../components/main/column/card/Card";
import PopupModal from "../../../../components/common/PopupModal";

const CardContainer = ({ title, body, index, columnId, cardId, previousCardId, isZanSang, setColumnData}) => {
    const [x, setX] = useState();
    const [y, setY] = useState();
    const [left, setLeft] = useState(0);
    const [top, setTop] = useState(0);
    const [isDown, setDown] = useState(false);
    const [moveX, setMoveX] = useState(0);
    const [moveY, setMoveY] = useState(0);
    const timer = useRef(null)
    
    const mouseDownHandler = (e) => {
        if(isZanSang) return;
        setX(()=>e.clientX);
        setY(()=>e.clientY);
        timer.current = setTimeout(()=>setDown(()=>true),500)
    };

    useEffect(() => {
        if(!isDown) return
        let targetColumn = moveX + columnId
        let targetIndex = moveY + index
        targetIndex = targetIndex > 0 ? targetIndex : 0
        targetColumn = targetColumn > 1 ? targetColumn : 1
        const card = {title, body, columnId:targetColumn, previousCardId, cardId, isZanSang:true}
        setColumnData((data)=>{
            const newData = [...data.map(v=>({columnId:v.columnId, name:v.name, cards:v.cards.filter(({isZanSang})=>!isZanSang)}))]
            
            const columnIndex = Math.min(targetColumn, newData.length)-1
            const rowIndex = Math.min(targetIndex,newData[targetColumn-1].cards.length)

            const left = newData[columnIndex].cards.slice(0,rowIndex)
            const right = newData[columnIndex].cards.slice(rowIndex)
            newData[columnIndex].cards = left.concat(card, right)
            return newData
        });
    // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [moveX, moveY]);

    const mouseMoveHandler = (e) => {
        if (!isDown) return;
        setLeft(() => e.clientX - x);
        setTop(() => e.clientY - y);

        setMoveX(() => Math.floor((e.clientX - x) / 348));
        setMoveY(() => Math.floor((e.clientY - y) / 104));
    };

    const mouseUpHandler = () => {
        clearTimeout(timer.current)
        if(!isDown)return
        setDown(()=>false);
        setLeft(0);
        setTop(0);
        setColumnData( (data)=>{
            const newData = [...data]
            newData[columnId-1].cards = newData[columnId-1].cards.filter((_, i) => i !== index)


            const zanSangColumn = newData.find(({cards})=>cards.find(({isZanSang})=>isZanSang))
            const zanSang = zanSangColumn.cards.find(({isZanSang})=>isZanSang)
            const zanSangCardIndex = zanSangColumn.cards.map(({isZanSang}, i)=>isZanSang ? i : null).filter(e=>e!==null)[0]
            
            if (newData[columnId-1].cards[index] !== undefined)
            newData[columnId-1].cards[index].previousCardId = zanSang.previousCardId

            zanSang.columnId = zanSangColumn.columnId
            const upsideCard = (zanSangCardIndex===0) ? {cardId:0} : zanSangColumn.cards[zanSangCardIndex-1]
            zanSang.previousCardId = upsideCard.cardId

            if (zanSangCardIndex<zanSangColumn.cards.length-1) newData[zanSang.columnId-1].cards[zanSangCardIndex+1].previousCardId = zanSang.cardId


            axios.put(`api/columns/${columnId}/cards/${cardId}`, {card: zanSang})
            
            return newData.map((v)=>{
                return {columnId:v.columnId, name:v.name, cards:v.cards.map((card)=>{
                    const newCard = {...card}
                    if(newCard.isZanSang) {
                        zanSang.isZanSang = false
                        return zanSang
                    }
                    return newCard
                })}
            })
        })
    };

    const [isCardDelHover, setIsCardDelHover] = useState(false);
    const [isPopubVisible, setIsPopubVisible] = useState(false);

    const onClickDeleteCardHandler  = () => setIsPopubVisible(true);
    const onDoubleClickEditCardHandler = () => {
        setColumnData((data)=>{
            const newData = [...data];
            const left = newData[columnId-1].cards.slice(0, index);
            const right = newData[columnId-1].cards.slice(index + 1);
            newData[columnId-1].cards = left.concat({ title, body, isInput: true, previousCardId, cardId, columnId }, right);
            return newData;
        })
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
        setColumnData((data)=>{
            const newData = [...data]
            newData[columnId-1].cards = newData[columnId-1].cards.filter((_, i) => i !== index)
            return newData;
        });
        axios.delete(`api/columns/${columnId}/cards/${cardId}`);
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
