import axios from 'axios';
import React, { useEffect, useState } from 'react';
import styled, { css } from 'styled-components';
import ColumnDeleteButton from './partial/ColumnDeleteButton'

const CardWrapper = styled.div.attrs(({top, left, isDown, isZanSang})=>({
    style:{
        transform: `translate(${left}px,${top}px)`,
        zIndex: isDown ? 1 : 0,
        position: isDown ? "absolute" : "relative",
        opacity : isZanSang ? 0.5 : 1
    }
}))`
    --background-color: #fff;
    --boxShadow-color: rgba(224, 224, 224, 0.3);

    width: 300px;
    padding: 16px;
    background-color: var(--background-color);
    border-radius: 8px;
    box-shadow: 0px 1px 30px var(--boxShadow-color);
    margin: 10px 0;
`;

// CardTitle, CardContent, CardAuthor --> p 태그
const CSSCardCommonStyle = css`
    font-family: Noto Sans KR;
    margin-bottom: 10px;
`;


const CardTitle = styled.p`
    display: flex;

    span.title {
        ${CSSCardCommonStyle}
        margin-right: auto;
        font-weight: 600;
        font-size: 16px;
    }
`;

const CardContent = styled.p`
    ${CSSCardCommonStyle}
    font-weight: normal;
    font-size: 14px;
`;

const CardAuthor = styled.p`
    ${CSSCardCommonStyle}
    --author-text-color: #bdbdbd;
    font-weight: normal;
    font-size: 12px;

    color: var(--author-text-color);
`;
//prettier-ignore
const Card = ({ title, body, index, columnId, cardId, previousCardId, isZanSang, setColumnData}) => {
    const [x, setX] = useState()
    const [y, setY] = useState()
    const [left, setLeft] = useState(0)
    const [top, setTop] = useState(0)
    const [isDown, setDown] = useState(false)

    const deleteCard = () => {
        // setCardList((cardList) => cardList.filter((_, i) => i !== index))
        setColumnData((data)=>{
            const newData = [...data]
            newData[columnId-1].cards = newData[columnId-1].cards.filter((_, i) => i !== index)
            return newData
        })
        axios.delete(`api/columns/${columnId}/cards/${cardId}`)
    }

    const editCard = () => {
        // setCardList((cardList) => {
        //     const left = cardList.slice(0, index);
        //     const right = cardList.slice(index + 1);
        //     return left.concat({ title, body, isInput: true, previousCardId, cardId, columnId }, right);
        // });
        setColumnData((data)=>{
            const newData = [...data]
            const left = newData[columnId-1].cards.slice(0, index);
            const right = newData[columnId-1].cards.slice(index + 1);
            newData[columnId-1].cards = left.concat({ title, body, isInput: true, previousCardId, cardId, columnId }, right);
            return newData
        })
    };

    
    const mouseDownHandler = (e) => {
        if(isZanSang) return
        setX(()=>e.clientX)
        setY(()=>e.clientY)
        setDown(()=>true)
        // setCardList((cardList) => {
        //     const left = cardList.slice(0, index+1);
        //     const right = cardList.slice(index+1);
        //     return left.concat({title, body, index, columnId, setCardList, cardId, previousCardId, isZanSang:true}, right);
        // });
        // setColumnData((data)=>{
        //     const newData = [...data]
        //     const left = newData[columnId-1].cards.slice(0, index);
        //     const right = newData[columnId-1].cards.slice(index + 1);
        //     newData[columnId-1].cards = left.concat({ title, body, isZanSang: true, previousCardId, cardId, columnId }, right);
        //     return newData
        // })
    }

    const [moveX, setMoveX] = useState(0)
    const [moveY, setMoveY] = useState(0)
    useEffect(()=>{
        // if(!isDown) return
        // setCardList((cardList) => cardList.filter((v) => v.isZanSang !== true))
        // setCardList((list)=>{
        //     const targetIndex = moveY + index
        //     const left = list.slice(0, targetIndex);
        //     const right = list.slice(targetIndex);
            
        //     return left.concat({title, body, index, setCardList, columnId, cardId, previousCardId, isZanSang:true}, right) 
        // })
    },[moveY])

    const mouseMoveHandler = (e) => {
        if(!isDown) return
        setLeft(()=>e.clientX-x)
        setTop(()=>e.clientY-y)
        
        setMoveX(()=>Math.floor((e.clientX-x)/348))
        setMoveY(()=>Math.floor((e.clientY-y)/104))
    }
    const mouseUpHandler = () => {
        setDown(()=>false)
        setLeft(0)
        setTop(0)
        // setCardList((cardList) => cardList.filter((_, i) => i !== index))
        // setCardList((cardList) => cardList.map((v) => {
        //     return !v.isZanSang ? v : {...v, isZanSang:false}
        // }))
        //위부분 return은 axios.put으로 새로받아온 카드로
        const card = {title, body, columnId, previousCardId, cardId}
        let targetColumn = moveX + columnId
        let targetIndex = moveY + index
        targetIndex = targetIndex > 0 ? targetIndex : 0
        targetColumn = targetColumn > 0 ? targetColumn : 0
        console.log(targetIndex)
        // setColumnData((data)=>{
        //     const newData = [...data]
        //     // newData[columnId-1].cards = newData[columnId-1].cards.filter((_, i) => i !== index)
        //     const left = newData[targetColumn-1].cards.slice(0,targetIndex)
        //     const right = newData[targetColumn-1].cards.slice(targetIndex)
        //     newData[targetColumn-1].cards = left.concat(card, right)
        //     return newData
        // })


        // setColumnData((data)=>{
        //     return [...data].map((v,i)=>{
        //         if(i!==targetColumn) return v
        //         const left = v.cards.slice(0, targetIndex);
        //         const right = v.cards.slice(targetIndex);
        //         const card2 = left.concat(card, right)
        //         return {columnId:v.columnId, name:v.name, cards:card2};
        //     })
        // })

    }


    return (
        <CardWrapper top={top} left={left} isDown={isDown} isZanSang={isZanSang} onDoubleClick={editCard}>
            <CardTitle>
                <span className="title">{title}</span>
                <ColumnDeleteButton onClick={deleteCard} />
            </CardTitle>
            <CardContent>{body}</CardContent>
            <CardAuthor>author by web</CardAuthor>
        </CardWrapper>
    );
};

export default Card;
