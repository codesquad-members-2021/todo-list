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

const ActivityItem = (/*{ logData: { author, content } } */) => {
    return (
        <>
        {/* 임시, 데이터 핸들링하게되면 하나만 만들어놓기 */}
        <StyledActivityItemWrapper>
            <StyledActivityItem>
                <img src="/images/smile.png" alt="smile" height="100%" width="32px" />

                <StyledActivityItemContent>
                    <div className="author">@이름</div>
                    <div className="content">
                        <span className="bold">[컬럼이름]</span>에{" "}
                        <span className="bold">[카드제목]</span>을{" "}
                        <span className="bold">[동작-등록]</span>하였습니다.
                    </div>
                    <div className="time">
                        1분 전
                    </div>
                </StyledActivityItemContent>
            </StyledActivityItem>
        </StyledActivityItemWrapper>

        <StyledActivityItemWrapper>
            <StyledActivityItem>
                <img src="/images/smile.png" alt="smile" height="100%" width="32px" />

                <StyledActivityItemContent>
                    <div className="author">@이름</div>
                    <div className="content">
                        <span className="bold">[카드제목]</span>를{" "}
                        <span className="bold">[컬럼이름1]</span>에서{" "}
                        <span className="bold">[컬럼이름2]</span>로{" "}
                        <span className="bold">[동작-이동]</span>하였습니다.
                    </div>
                    <div className="time">
                        1분 전
                    </div>
                </StyledActivityItemContent>

            </StyledActivityItem>
        </StyledActivityItemWrapper>
        </>
    );
};

export default ActivityItem;
