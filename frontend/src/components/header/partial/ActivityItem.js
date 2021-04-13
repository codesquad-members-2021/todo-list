import React from 'react';
import styled from 'styled-components';

const StyledActivityItem = styled.div`
    width: 100%;
    margin-top: 8px;

    .item {
        display: grid;
        grid-template-columns: 20% 80%;
        padding: 10px;
        border: 1px solid #000;
        border-radius: 5px;
        margin: 0px 10px;
    }

    .item__content--time {
        color: #bdbdbd;
    }

    .item__content {
        font-size: 16px;

        .item__content--log .bold {
            font-weight: 800;
        }
    }
`;

const ActivityItem = ({logData: {author, content}}) => {
    return (
        <StyledActivityItem>
            <div className="item">
                <div className="item__img">
                    이미지
                </div>
                <div className="item__content">
                    <p>@{author}</p>
                    <div className="item__content--log">{content}</div>
                    {/*
                    <p>@sam</p>
                    <div className="item__content--log">
                        <span className="bold">해야할 일</span>에{' '}
                        <span className="bold">HTML/CSS공부하기</span> 를{' '}
                        <span className="bold">등록</span>하였습니다.
                    </div>
                    <p className="item__content--time">1분 전</p> */}
                </div>
            </div>
        </StyledActivityItem>
    );
};

export default ActivityItem;
