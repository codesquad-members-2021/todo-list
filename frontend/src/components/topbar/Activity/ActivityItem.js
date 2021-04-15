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

const ActivityItem = ({ toColumn, fromColumn, title, action, actionUserId, convertTime }) => {
    return (
        <StyledActivityItemWrapper>
            <StyledActivityItem>
                <img src="/images/smile.png" alt="smile" height="100%" width="32px" />

                <StyledActivityItemContent>
                    <div className="author">@작성자ID-{actionUserId}</div>
                        {/* action 등록, 변경, 삭제 */}
                        {action !== "이동" ? (
                            <div className="content">
                                <span className="bold">{toColumn}</span>
                                {action === '등록'
                                    ? '에'
                                    : (action === '변경' || action === '삭제') && '에서'
                                }{' '}
                                <span className="bold">{title}</span>을{' '}
                                <span className="bold">{action}</span>하였습니다.
                            </div>
                        ) : (
                            <div className="content">
                                <span className="bold">{title}</span>를{" "}
                                <span className="bold">{fromColumn}</span>에서{" "}
                                <span className="bold">{toColumn}</span>로{" "}
                                <span className="bold">{action}</span>하였습니다.
                            </div>
                        )}
                    <div className="time">{convertTime}</div>
                </StyledActivityItemContent>
            </StyledActivityItem>
        </StyledActivityItemWrapper>
    );
};

export default ActivityItem;
