import React from 'react';
import styled from 'styled-components';
import ActivityCloseButton from './ActivityCloseButton';
import ActivityItem from './ActivityItem';

const StyledActivity = styled.div`
    --background-color: #fff;

    transform: ${(props) =>
        props.activityHide ? 'translateX(100%)' : 'translateX(0%)'};
    transition: transform 0.4s;

    position: absolute;
    top: 0;
    right: 0;

    width: 452px;
    height: 100%;
    background-color: var(--background-color, #fff);
    box-shadow: 0px 0px 4px rgba(204, 204, 204, 0.5),
        0px 2px 4px rgba(0, 0, 0, 0.25);
    backdrop-filter: blur(4px);

    padding: 0 20px 20px;
    overflow-y: scroll;
    z-index: 9999;
`;

const CloseWrapper = styled.div`
    display: flex;
    align-items: center;
    position: relative;

    height: 112px;
    padding-right: 50px;
`;

const ActivityItemsWrapper = styled.div`
    padding-bottom: 50px;
`;

const Activity = ({ activityHide, activityDatas, onClickForLogVisible }) => {
    return (
        <StyledActivity activityHide={activityHide}>
            <CloseWrapper>
                <ActivityCloseButton onClick={onClickForLogVisible} />
            </CloseWrapper>
            <ActivityItemsWrapper>
                {activityDatas && activityDatas.map((data, i) => (
                    <ActivityItem key={i} {...data} />
                ))}
            </ActivityItemsWrapper>
        </StyledActivity>
    );
};

export default Activity;
