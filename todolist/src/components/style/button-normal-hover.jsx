import styled from 'styled-components';

const ButtonNormalHover = styled.div`
  display: flex;

  justify-content: center;
  align-items: center;
  padding: 10px;

  width: 134px;
  height: 40px;

  background: #828282;
  border-radius: 6px;
`;

const ButtonNormalHoverText = styled.div`
  width: 114px;
  height: 20px;

  font-weight: normal;
  font-size: 14px;
  line-height: 20px;
  text-align: center;

  color: #ffffff;

  flex: none;
  order: 0;
  flex-grow: 0;
  margin: 0px 10px;
`;

export { ButtonNormalHover, ButtonNormalHoverText };
