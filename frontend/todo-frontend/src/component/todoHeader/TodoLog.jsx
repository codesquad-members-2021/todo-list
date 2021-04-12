import React from "react";

const TodoLog = ({
  author,
  log: { columnTitle, itemTitle, action, date, movedColumnTitle },
}) => {
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
    <div>
      <div>@{author}</div>
      <div>{logMessage}</div>
      <div>{Math.floor((Date.now() - date) / 60000)}분전</div>
    </div>
  );
};

export default TodoLog;
