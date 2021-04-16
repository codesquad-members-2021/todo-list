function LogMessage({ log }) {
  switch (log.modeType) {
    case "add":
      return (
        <div>
          <strong>{log.columnTitle}</strong>에 <strong>{log.cardTitle}</strong>
          아이템을 <strong>등록</strong>하였습니다.
        </div>
      );
    case "transfer":
      return (
        <div>
          <strong>{log.cardTitle}</strong>를 <strong>하고 있는 일</strong>에서
          <strong>{log.columnTitle}</strong>로 <strong>이동</strong>하였습니다.
        </div>
      );
    case "update":
      return (
        <div>
          <strong>{log.columnTitle}</strong>에 <strong>{log.cardTitle}</strong>
          의 내용이 <strong>변경</strong>되었습니다.
        </div>
      );
    case "delete":
      return (
        <div>
          <strong>{log.cardTitle} </strong>아이템이 <strong>삭제</strong>
          되었습니다.
        </div>
      );
    default:
      throw new Error("Invalid ModeType");
  }
}

export default LogMessage;
