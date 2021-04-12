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
        margin-top: 8px
    }
`;

const CardInputButtons = styled.div`
    margin-top: 10px;
    display: flex;
    justify-content: space-around;
`;

//prettier-ignore
const CardInput = ({ title, body, index, setCardList }) => {
    const [inputTitle, setTitle] = useState(title);
    const [inputBody, setBody] = useState(body);
    const isAble = inputTitle.length * inputBody.length;

    const addCard = () => {
        if (!isAble) return;
        setCardList((cardList) => {
            const left = cardList.slice(0, index);
            const right = cardList.slice(index + 1);
            return left.concat({ title: inputTitle, body: inputBody }, right);
        });
    };

    const deleteCard = () => setCardList((cardList) => cardList.filter((_, i) => i !== index));

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
