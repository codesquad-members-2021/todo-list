import styled from 'styled-components';

const ButtonNormal = styled.button`
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 10px;

  width: 134px;
  height: 40px;

  background: #e0e0e0;
  border-radius: 6px;
  cursor: pointer;

  &:hover {
    background: #828282;
  }
`;

const ButtonNormalText = styled.div`
  width: 114px;
  height: 20px;

  font-weight: normal;
  font-size: 14px;
  line-height: 20px;
  text-align: center;

  color: #828282;

  margin: 0px 10px;

  &:hover {
    color: #ffffff;
  }
`;

export { ButtonNormal, ButtonNormalText };
