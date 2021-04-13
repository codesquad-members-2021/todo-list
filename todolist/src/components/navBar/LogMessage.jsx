function LogMessage({ log }) {
  let message = null;
  if (log.modeType === "add")
    message = `<strong>${log.columnTitle}</strong>에 <strong><${log.cardTitle}></strong>를 <strong>등록</strong>하였습니다.`;
  if (log.modeType === "transfer")
    message = `<strong><${log.cardTitle}></strong>를 <strong>하고 있는 일</strong>에서 <strong>${log.columnTitle}</strong>로  <strong>이동</strong>하였습니다.`;
  if (log.modeType === "edit")
    message = `<strong><${log.columnTitle}></strong> 내용이 변경되었습니다.`;
  if (log.modeType === "delete")
    message = `<strong><${log.columnTitle}></strong> 삭제되었습니다.`;
  return <div dangerouslySetInnerHTML={{ __html: message }} />;
}

export default LogMessage;
// const message = null;
//   switch (log.modeType) {
//     case "add":
//       message = `<div><span>${log.columnTitle}<span>에 <span>${log.cardTitle}<span>를 <span>등록<span>하였습니다.</div>`;
//       break;
//     case "transfer":
//       break;
//     case "edit":
//       break;
//     case "delete":
//       break;
//     default:
//       throw new Error("Invalid ModeType");
//   }

//   return <div>{message}</div>;
