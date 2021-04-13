import React from 'react';
import { LogCardContainer } from './sidebarStyle';

const LogCard = ({ data: { logList }, userID }) => {
  const log = logList.map((log) => {
    const { id, title, action, time, from, to } = log;

    const ActionPrint = ({ from, to }) => {
      if (from && to)
        return (
          <span>
            <span className="move">{from}</span>에서{' '}
            <span className="move">{to}</span>로
          </span>
        );
      else return <></>;
    };

    return (
      <LogCardContainer key={id}>
        <div className="user">@{userID}</div>
        <span>
          <span className="title">{title}</span>를
        </span>
        <ActionPrint from={from} to={to} />
        <span>
          <span className="action">{action}</span>하였습니다.
        </span>
        <div className="time">{time}</div>
      </LogCardContainer>
    );
  });

  return <>{log}</>;
};

export default LogCard;
