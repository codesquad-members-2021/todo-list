import styled from "styled-components";

const InputContentsSection = styled.div`
  width: 276px;
  margin: 8px 0px;
`;

const InputContentsTextarea = styled.textarea`
  width: 100%;
  height: 100%;
  font-family: Noto Sans KR;
  font-style: normal;
  font-weight: normal;
  font-size: 14px;
  line-height: 20px;

  /* Gray 3 */

  color: #828282;

  /* Inside Auto Layout */

  flex: none;
  order: 1;
  flex-grow: 0;

  border: none;
  outline: none;
  resize: none;
  overflow: auto;
`;

export { InputContentsSection, InputContentsTextarea };
