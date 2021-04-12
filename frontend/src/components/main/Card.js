import React from 'react';
import styled, { css } from 'styled-components';
import ColumnDeleteButton from './partial/ColumnDeleteButton'

const CardWrapper = styled.div`
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

const Card = ({ title, body, author, index, list, clickHandler, dbClickHandler }) => {

    const deleteEvent = () => {
        list.splice(index, 1)
        clickHandler()
    }
    const dbClickEvent = () => dbClickHandler(index, {title, body})

    return (
        <CardWrapper onDoubleClick={dbClickEvent}>
            <CardTitle>
                <span className="title">{title}</span>
                <ColumnDeleteButton onClick={deleteEvent} />
            </CardTitle>
            <CardContent>{body}</CardContent>
            <CardAuthor>author by {author}</CardAuthor>
        </CardWrapper>
    );
};

export default Card;
