import styled from "styled-components";
import crong from "./crong.jpg";
import LogMessage from "./LogMessage";

function LogCommit({ logs }) {
  const timeChecking = (logTime) => {
    const passedTime = Math.floor((Date.now() - logTime) / 1000);
    console.log(passedTime);
    if (passedTime < 3) return "방금 전";
    if (3 < passedTime && passedTime < 60) return `${passedTime}초 전`;
    else if (60 <= passedTime && passedTime < 3600)
      return `${Math.floor(passedTime / 60)}분 전`;
    else if (3600 <= passedTime && passedTime < 86400)
      return `${passedTime / 3600}시간 전`;
    else return "";
  };

  logs = [...logs].reverse();
  console.log(logs);
  return (
    <>
      {logs.map(
        (log, index) =>
          !log.start && (
            <LogBlock key={index}>
              <User>
                <UserImg />@ Crong
              </User>
              <LogMessage log={log}></LogMessage>
              <Time>{timeChecking(log.publishedTime)}</Time>
            </LogBlock>
          )
      )}
    </>
  );
}
const LogBlock = styled.div`
  padding: 16px;
  position: static;
  width: 332px;
  height: 137px;
  left: 0px;
  top: 0px;
  background: #ffffff;
  flex: none;
  order: 0;
  flex-grow: 0;
  margin: auto auto;
`;
const User = styled.div`
  display: flex;
  align-items: center;
  margin-bottom: 10px;
`;
const UserImg = styled.div`
  width: 30px;
  height: 30px;
  background-image: url(${crong});
  background-size: cover;
  border-radius: 50%;
  margin-right: 10px;
`;
const Time = styled.div`
  margin-top: 10px;
  font-size: 10px;
  color: light-grey;
`;
export default LogCommit;
