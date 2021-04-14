import axios from 'axios';
import React, { useState } from 'react';
import styled from 'styled-components';
import ColumnAccentButton from './partial/ColumnAccentButton';
import ColumnNormalButton from './partial/ColumnNormalButton';

const CardInputWrapper = styled.div`
    --background-color: #fff;
    --boxShadow-color: rgba(224, 224, 224, 0.3);

    width: 300px;
    padding: 16px;
    background-color: var(--background-color);
    border-radius: 8px;
    box-shadow: 0px 1px 30px var(--boxShadow-color);

    margin: 10px 0;

    display: flex;
    flex-direction: column;
    justify-content: center;
`;

const CardInputInput = styled.input`
    width: 100%;
    border: none;
    background-color: transparent;
    font-size: 14px;

    & + & {
        margin-top: 8px;
    }
`;

const CardInputButtons = styled.div`
    margin-top: 10px;
    display: flex;
    justify-content: space-around;
`;
//prettier-ignore
const CardInput = ({ title, body, index, columnId, cardId, previousCardId, setColumnData }) => {
    const [inputTitle, setTitle] = useState(title);
    const [inputBody, setBody] = useState(body);
    const isAble = inputTitle.length * inputBody.length;

    const addCard = async () => {
        if (!isAble) return;
        const json = title.length * body.length
        ? await axios.put(`api/columns/${columnId}/cards/${cardId}`, {card: { title: inputTitle, body:inputBody, columnId, cardId, previousCardId}})
        : await axios.post(`api/columns/${columnId}/cards/`, {card: { title: inputTitle,body:inputBody}})
        // setCardList((cardList) => {
        //     const left = cardList.slice(0, index);
        //     const right = cardList.slice(index + 1);
        //     return left.concat(json.data.card, right);
        // });
        setColumnData((data)=>{
            const newData = [...data]
            const left = newData[columnId-1].cards.slice(0, index);
            const right = newData[columnId-1].cards.slice(index + 1);
            newData[columnId-1].cards = left.concat(json.data.card, right);
            return newData
        })
    };

    const deleteCard = () => {
        // setCardList((cardList) => cardList.filter((_, i) => i !== index));
        title.length * body.length
        ? setColumnData((data)=>{
            const newData = [...data]
            const left = newData[columnId-1].cards.slice(0, index);
            const right = newData[columnId-1].cards.slice(index + 1);
            newData[columnId-1].cards = left.concat({ title, body, previousCardId, cardId, columnId }, right);
            return newData
        })
        : setColumnData((data)=>{
            const newData = [...data]
            newData[columnId-1].cards = newData[columnId-1].cards.filter((_, i) => i !== index)
            return newData
        })
    }

    const changeTitle = ({ target }) => setTitle(() => target.value);

    const changeBody = ({ target }) => setBody(() => target.value);

    return (
        <CardInputWrapper>
            <CardInputInput
                placeholder="제목을 입력하세요"
                onChange={changeTitle}
                value={inputTitle}
            />
            <CardInputInput
                placeholder="내용을 입력하세요"
                onChange={changeBody}
                value={inputBody}
            />
            <CardInputButtons>
                <ColumnNormalButton clickHandler={deleteCard}>
                    취소
                </ColumnNormalButton>
                <ColumnAccentButton
                    clickHandler={addCard}
                    isAble={isAble}
                >
                    {title.length * body.length ? '수정' : '등록'}
                </ColumnAccentButton>
            </CardInputButtons>
        </CardInputWrapper>
    );
};

export default CardInput;
