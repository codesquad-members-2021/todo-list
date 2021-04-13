import styled from 'styled-components';

const SidebarContainer = styled.div`
  display: flex;
  flex-direction: column;
  position: absolute;
  align-items: center;
  width: 452px;
  height: 824px;
  animation-duration: 3s;
  animation-name: slidein;
  top: -100px;
  background: #ffffff;
  box-shadow: 0px 0px 4px rgba(204, 204, 204, 0.5),
    0px 2px 4px rgba(0, 0, 0, 0.25);
  backdrop-filter: blur(4px);
`;

const CloseContainer = styled.div`
  position: relative;
  left: 10rem;
  padding-top: 30px;
  cursor: pointer;
`;

const LogListContainer = styled.div`
  display: flex;
  width: 80%;
  flex-direction: column;
`;

const LogCardContainer = styled.div`
  .user {
    color: gray;
  }
  .title,
  .action,
  .move {
    font-weight: 700;
  }
  .time {
    font-size: 14px;
    color: gray;
  }
  .emoji {
    float: left;
  }
  line-height: 1.3rem;
  font-size: 16px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  margin-top: 10px;
`;

export { SidebarContainer, CloseContainer, LogListContainer, LogCardContainer };
