import React from 'react';
import styled, { css } from 'styled-components';
import ColumnDeleteButton from '../ColumnDeleteButton';

const StyledCard = styled.div`
    --background-color: #fff;
    --boxShadow-color: rgba(224, 224, 224, 0.3);
    --white-red-color: #FFEEEC;
    --red-color:#FF4343;

    ${(props) =>
        props.isCardDelHover
            ? css`
                  background-color: var(--white-red-color);
                  border: 1px solid var(--red-color);
              `
            : css`
                  background-color: var(--background-color);
                  border: 1px solid var(--background-color);
              `};

    width: 300px;
    padding: 16px;
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

const Card = ({ data, isCardDelHover, onEvents }) => {
    const { title, body } = data;
    const {
        onClickDeleteCardHandler,
        onDoubleClickEditCardHandler,
        onMouseEnterHandler,
        onMouseLeaveHandler,
    } = onEvents;

    return (
        <StyledCard
            onDoubleClick={onDoubleClickEditCardHandler}
            isCardDelHover={isCardDelHover}
        >
            <CardTitle>
                <span className="title">{title}</span>
                <ColumnDeleteButton
                    onClick={onClickDeleteCardHandler}
                    onMouseEnter={onMouseEnterHandler}
                    onMouseLeave={onMouseLeaveHandler}
                />
            </CardTitle>
            <CardContent>{body}</CardContent>
            <CardAuthor>author by web</CardAuthor>
        </StyledCard>
    );
};

export default Card;
