import styled, { keyframes } from 'styled-components';



const SidebarContainer = styled.div`
  display: flex;
  flex-direction: column;
  position: absolute;
  align-items: center;
  width: 452px;   /* 0 ~ 452 */
  height: 1024px;
  /* left: 2000px;   */
  animation-duration: 3s;
  animation-name: slidein;
  top: -100px;
  background: #FFFFFF;
  box-shadow: 0px 0px 4px rgba(204, 204, 204, 0.5), 0px 2px 4px rgba(0, 0, 0, 0.25);
  backdrop-filter: blur(4px);
`;


const CloseContainer = styled.div`
  position: relative;
  left: 10rem;
  padding-top: 30px;
  cursor:pointer;
 
`;

const LogContainer = styled.div`
  display: flex;
  width: 80%;
  flex-direction: column;
`;


export { SidebarContainer, CloseContainer, LogContainer };
