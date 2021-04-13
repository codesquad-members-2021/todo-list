import styled from "styled-components";

const InputTitleSection = styled.div`
  width: 276px;
  height: 23px;
`;

const InputTitleTextarea = styled.textarea`
  width: 100%;
  height: 100%;
  font-family: Noto Sans KR;
  font-style: normal;
  font-weight: bold;
  font-size: 16px;
  line-height: 23px;

  /* Gray 3 */
  background-color: none;
  color: #828282;

  /* Inside Auto Layout */

  flex: none;
  order: 0;
  flex-grow: 0;

  border: none;
  outline: none;
  resize: none;
  overflow: hidden;
`;

export { InputTitleSection, InputTitleTextarea };
