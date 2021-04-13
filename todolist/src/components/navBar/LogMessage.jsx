function LogMessage({ log }) {
  console.log(log);
  let message = null;
  if (log.modeType === "add") message = "바보";
  return <span>{message}</span>;
  // const message = null;
  // switch (log.modeType) {
  //   case "add":
  //     message = `<div><span>${log.columnTitle}<span>에 <span>${log.cardTitle}<span>를 <span>등록<span>하였습니다.</div>`;
  //     break;
  //   case "transfer":
  //     break;
  //   case "edit":
  //     break;
  //   case "delete":
  //     break;
  //   default:
  //     throw new Error("Invalid ModeType");
  // }

  // return <div>{message}</div>;
}

export default LogMessage;
