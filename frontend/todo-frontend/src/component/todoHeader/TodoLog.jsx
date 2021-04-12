import React from "react";
import styled from "styled-components";

const TodoLog = ({
  author,
  log: { columnTitle, itemTitle, action, date, movedColumnTitle },
}) => {
  const LogCard = styled.div`
    display: flex;
    align-items: flex-start;
    width: 332px;
    height: 137px;
    padding: 16px;
  `;

  const LogDataSection = styled.div`
    display: flex;
    flex-direction: column;
    margin-left: 10px;
    width: 236px;
  `;

  const LogMessage = styled.div`
    font-family: Noto Sans KR;
    font-weight: bold;
    font-size: 16px;
    line-height: 23px;
  `;

  const TimeLog = styled.div`
    color: #828282;
    font-size: 14px;
  `;

  let logMessage;
  switch (action) {
    case "add":
      logMessage = `${columnTitle}에 ${itemTitle}을 등록하였습니다.`;
      break;
    case "delete":
      logMessage = `${columnTitle}에 ${itemTitle}을 삭제하였습니다.`;
      break;
    case "move":
      break;
    default:
      return;
  }
  return (
    <LogCard>
      <div>🥳</div>
      <LogDataSection>
        <div>@{author}</div>
        <LogMessage>{logMessage}</LogMessage>
        <TimeLog>{Math.floor((Date.now() - date) / 60000)}분전</TimeLog>
      </LogDataSection>
    </LogCard>
  );
};

export default TodoLog;
