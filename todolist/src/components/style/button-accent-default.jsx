import styled from 'styled-components';

const ButtonAccentDefault = styled.div`
  display: flex;

  justify-content: center;
  align-items: center;
  padding: 10px;

  width: 134px;
  height: 40px;

  background: #0075de;
  border-radius: 6px;
  border: none;
`;

const ButtonAccentDefaultText = styled.div`
  font-weight: bold;
  font-size: 14px;
  line-height: 20px;
  text-align: center;

  color: #ffffff;

  flex: none;
  order: 0;
  flex-grow: 0;
  margin: 0px 10px;
`;

export { ButtonAccentDefault, ButtonAccentDefaultText };
