import axios from 'axios';
import React, { useState } from 'react';
import styled from 'styled-components';
import AccentButton from '../common/AccentButton';
import NormalButton from '../common/NormalButton';

const StyledCardInput = styled.div`
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

const CardInputTag = styled.input`
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
const CardInput = ({ title, body, index, setCardList, columnId, cardId, previousCardId }) => {
    const [inputTitle, setTitle] = useState(title);
    const [inputBody, setBody] = useState(body);
    const isAble = inputTitle.length * inputBody.length;

    const addCard = async () => {
        if (!isAble) return;
        const json = title.length * body.length
        ? await axios.put(`api/columns/${columnId}/cards/${cardId}`, {card: { title: inputTitle, body:inputBody, columnId, cardId, previousCardId}})
        : await axios.post(`api/columns/${columnId}/cards/`, {card: { title: inputTitle,body:inputBody}})
        setCardList((cardList) => {
            const left = cardList.slice(0, index);
            const right = cardList.slice(index + 1);
            return left.concat(json.data.card, right);
        });
    };

    const deleteCard = () => setCardList((cardList) => cardList.filter((_, i) => i !== index));

    const changeTitle = ({ target }) => setTitle(() => target.value);

    const changeBody = ({ target }) => setBody(() => target.value);

    return (
        <StyledCardInput>
            <CardInputTag
                placeholder="제목을 입력하세요"
                onChange={changeTitle}
                value={inputTitle}
            />
            <CardInputTag
                placeholder="내용을 입력하세요"
                onChange={changeBody}
                value={inputBody}
            />
            <CardInputButtons>
                <NormalButton clickHandler={deleteCard}>
                    취소
                </NormalButton>
                <AccentButton
                    clickHandler={addCard}
                    isAble={isAble}
                >
                    {title.length * body.length ? '수정' : '등록'}
                </AccentButton>
            </CardInputButtons>
        </StyledCardInput>
    );
};

export default CardInput;
