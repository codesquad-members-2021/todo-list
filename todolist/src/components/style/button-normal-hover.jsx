import styled from 'styled-components';

const ButtonNormalHover = styled.div`
  /* Auto Layout */

  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  padding: 10px;

  width: 134px;
  height: 40px;

  /* Gray 5 */

  background: #828282;
  border-radius: 6px;
`;

const ButtonNormalHoverText = styled.div`
  /* title */
  width: 114px;
  height: 20px;

  font-family: Noto Sans KR;
  font-style: normal;
  font-weight: normal;
  font-size: 14px;
  line-height: 20px;
  text-align: center;

  /* Gray 3 */

  color: #ffffff;

  /* Inside Auto Layout */

  flex: none;
  order: 0;
  flex-grow: 0;
  margin: 0px 10px;
`;

export { ButtonNormalHover, ButtonNormalHoverText };
