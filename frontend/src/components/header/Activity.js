import React from 'react';
import styled from 'styled-components';
import ActivityCloseButton from "./partial/ActivityCloseButton";
import ActivityItem from "./partial/ActivityItem";

const StyledActivity = styled.div`
    --background-color: #fff;

    transform: ${(props) => (props.activityHide ? 'translateX(101%)' : 'translateX(0%)')};
    transition: transform 0.4s;

    position: absolute;
    top: 0;
    right: 0;

    width: 452px;
    background-color: var(--background-color, #FFF);
    box-shadow: 0px 0px 4px rgba(204, 204, 204, 0.5),
        0px 2px 4px rgba(0, 0, 0, 0.25);
    backdrop-filter: blur(4px);

    padding-bottom: 20px;
`;

const StyledCloseWrapper = styled.div`
    display: flex;
    align-items: center;
    position: relative;

    height: 112px;
    padding-right: 50px;
    border-bottom: 1px solid #13d47d; // 임시
`;

const Activity = ({ activityHide, activityDatas, onClickForLogVisible }) => {
    return (
        <StyledActivity activityHide={activityHide}>
            <StyledCloseWrapper>
                <ActivityCloseButton onClick = {onClickForLogVisible} />
            </StyledCloseWrapper>
            <div>
                {activityDatas.length > 0 &&
                    activityDatas.map((logData) => (
                        <ActivityItem key={logData.id} logData={logData} />
                    ))}
            </div>
        </StyledActivity>
    );
};

export default Activity;
