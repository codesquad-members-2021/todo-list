function LogMessage({ log }) {
  let message = null;
  switch (log.modeType) {
    case "add":
      message = `<div><span>${log.columnTitle}<span>에 <span>${log.cardTitle}<span>를 <span>등록<span>하였습니다.</div>`;
      break;
    case "transfer":
      message = `<strong><${log.cardTitle}></strong>를 <strong>하고 있는 일</strong>에서 <strong>${log.columnTitle}</strong>로  <strong>이동</strong>하였습니다.`;
      break;
    case "update":
      message = `<strong><${log.columnTitle}></strong>의 내용이 변경되었습니다.`;
      break;
    case "delete":
      message = `<strong><${log.cardTitle}></strong>가 삭제되었습니다.`;
      break;
    default:
      throw new Error("Invalid ModeType");
  }

  return <div dangerouslySetInnerHTML={{ __html: message }} />;
}
export default LogMessage;
