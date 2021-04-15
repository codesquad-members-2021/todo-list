function LogMessage({ log }) {
  let message = null;
  console.log(log);
  switch (log.modeType) {
    case "add":
      return (
        <div>
          <strong>{log.columnTitle}</strong>에<strong>{log.cardTitle}</strong>를{" "}
          <strong>등록</strong>하였습니다.
        </div>
      );
    case "transfer":
      return (
        <div>
          <strong>{log.cardTitle}</strong>를 <strong>하고 있는 일</strong>에서{" "}
          <strong>{log.columnTitle}</strong>로 <strong>이동</strong>하였습니다.
        </div>
      );

    case "update":
      return (
        <div>
          <strong>{log.columnTitle}</strong>에 <strong>{log.cardTitle}</strong>
          의 내용이 변경되었습니다.
        </div>
      );
    case "delete":
      return (
        <div>
          <strong>{log.cardTitle}</strong>가 삭제되었습니다.
        </div>
      );
    default:
      throw new Error("Invalid ModeType");
  }

  // return <div dangerouslySetInnerHTML={{ __html: message }} />;
  return message;
}
export default LogMessage;
