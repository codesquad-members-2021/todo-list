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

const CardInput = ({ list, index, clickHandler, isModify, originCard }) => {
    const [title, setTitle] = useState(isModify ? originCard.title : '');
    const [body, setBody] = useState(isModify ? originCard.body : '');
    const [isAble, setAbility] = useState(isModify ? true : false);

    const addCard = () => {
        if (!isAble) return;
        list.splice(index, isModify ? 1 : 0, { title, body, author: 'web' });
        clickHandler();
    };
    const deleteCard = () => clickHandler();
    const changeTitle = ({ target }) => {
        setTitle(() => {
            body.length * target.value.length
                ? setAbility(true)
                : setAbility(false);
            return target.value;
        });
    };
    const changebody = ({ target }) => {
        setBody(() => {
            title.length * target.value.length
                ? setAbility(true)
                : setAbility(false);
            return target.value;
        });
    };
    return (
        <CardInputWrapper>
            <CardInputInput
                placeholder="제목을 입력하세요"
                onChange={changeTitle}
                value={title}
            />
            <CardInputInput
                placeholder="내용을 입력하세요"
                onChange={changebody}
                value={body}
            />
            <CardInputButtons>
                <ColumnNormalButton clickHandler={deleteCard}>
                    취소
                </ColumnNormalButton>
                <ColumnAccentButton
                    clickHandler={addCard}
                    isAble={isAble}
                >
                    {isModify ? '수정' : '등록'}
                </ColumnAccentButton>
            </CardInputButtons>
        </CardInputWrapper>
    );
};

export default CardInput;
