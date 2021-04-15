import React from 'react';
import styled from 'styled-components';

const StyledActivityItemWrapper = styled.div`
    width: 100%;
    margin-top: 8px;
`;

const StyledActivityItem = styled.div`
    --skyblue-color: #BEF7FF;
    display: flex;
    align-items: center;
    padding: 16px 24px;
    border-radius: 8px;
    background-color: var(--skyblue-color);
`;

const StyledActivityItemContent = styled.div`
    --black-color: #010101;
    --gray-color: #828282;
    margin-left: 20px;
    flex-grow: 1;
    font-family: Noto Sans KR;
    font-size: 14px;
    line-height: 18px;

    .author, .content {
        margin-bottom: 10px;
    }

    .content .bold {
        font-weight: 600;
    }

    .time {
        color: var(--gray-color);
    }
`;

const ActivityItem = ({ action, convertTime, from, title, to, user }) => {
    return (
        <StyledActivityItemWrapper>
            <StyledActivityItem>
                <img src="/images/smile.png" alt="smile" height="100%" width="32px" />

                <StyledActivityItemContent>
                    <div className="author">@{user}</div>
                        <div className="content">
                            <span>{action + " "}</span>
                            <span className="bold">{title}</span>
                            {(action === "Moved") && (
                                <>
                                    <span>{" from "}</span>
                                    <span className="bold">{from}</span>
                                </>
                            )}
                            {(action === "Moved" || action === "Added") && (
                                <>
                                    <span>{" to "}</span>
                                    <span className="bold">{to}</span>
                                </>
                            )}
                        </div>
                    <div className="time">{convertTime}</div>
                </StyledActivityItemContent>
            </StyledActivityItem>
        </StyledActivityItemWrapper>
    );
};

export default ActivityItem;
