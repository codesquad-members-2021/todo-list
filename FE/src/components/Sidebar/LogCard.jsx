import React from 'react';
import { LogContainer, LogCardContainer } from './sidebarStyle';

const LogCard = ({ logData }) => {
  const log = logData.map((log) => {
    const { id, cardTitle, action, time, previousBoard, currentBoard } = log;

    const ActionPrint = ({ previousBoard, currentBoard }) => {
      if (previousBoard && currentBoard)
        return (
          <span>
            <span className="move">{previousBoard}</span>에서{' '}
            <span className="move">{currentBoard}</span>로
          </span>
        );
      else return <></>;
    };

    const GetTimeDiff = ({ time }) => {
      const now = new Date();
      const logTime = new Date(time);
      const diff = Math.floor((now - logTime) / 60000);
      if (diff < 60)
        return (
          <>
            <span>{diff}분전</span>
          </>
        );
      else if (diff < 1440 && diff >= 60)
        return (
          <>
            <span>
              {Math.floor(diff / 60)}시간 {diff % 60}분 전
            </span>
          </>
        );
      else if (diff >= 1440)
        return (
          <>
            <span>{Math.floor(diff / 1440)}일 전</span>
          </>
        );
        else return null;
    };

    return (
      <LogContainer key={id}>
        <div className="emoji">🥳</div>
        <LogCardContainer key={id}>
          <div className="user"></div>
          <span>
            <span className="title">{cardTitle}</span>를
          </span>
          <ActionPrint
            previousBoard={previousBoard}
            currentBoard={currentBoard}
          />
          <span>
            <span className="action">{action}</span>하였습니다.
          </span>
          <div className="time">
            <GetTimeDiff time={time} />
          </div>
        </LogCardContainer>
      </LogContainer>
    );
  });

  return <>{log}</>;
};

export default LogCard;
