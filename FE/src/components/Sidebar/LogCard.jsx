import React from 'react';
import { LogContainer, LogCardContainer } from './sidebarStyle';

const LogCard = ({ data: { logs }, userID }) => {
  const log = logs.map((log) => {
    const { id, card_title, action, time, prevBoard, currBoard } = log;

    const ActionPrint = ({ prevBoard, currBoard }) => {
      if (prevBoard && currBoard)
        return (
          <span>
            <span className="move">{prevBoard}</span>에서{' '}
            <span className="move">{currBoard}</span>로
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
      if (diff < 1440 && diff >= 60)
        return (
          <>
            <span>
              {Math.floor(diff / 60)}시간 {diff % 60}분 전
            </span>
          </>
        );
      if (diff >= 1440)
        return (
          <>
            <span>{Math.floor(diff / 1440)}일 전</span>
          </>
        );
    };

    return (
      <LogContainer key={id}>
        <div className="emoji">🥳</div>
        <LogCardContainer key={id}>
          <div className="user">@{userID}</div>
          <span>
            <span className="title">{card_title}</span>를
          </span>
          <ActionPrint prevBoard={prevBoard} currBoard={currBoard} />
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
