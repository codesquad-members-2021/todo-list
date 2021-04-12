import styled from 'styled-components';

const ButtonAccentDefault = styled.div`
  /* Auto Layout */

  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  padding: 10px;

  width: 134px;
  height: 40px;

  /* Blue */

  background: #0075de;
  border-radius: 6px;
  border: none;
`;

const ButtonAccentDefaultText = styled.div`
  font-weight: bold;
  font-size: 14px;
  line-height: 20px;
  text-align: center;

  /* White */

  color: #ffffff;

  /* Inside Auto Layout */

  flex: none;
  order: 0;
  flex-grow: 0;
  margin: 0px 10px;
`;

export { ButtonAccentDefault, ButtonAccentDefaultText };
