import React from "react";
import styled from "styled-components";

const StyledInput = styled.input`
  /* body */
  position: static;
  width: 276px;
  height: 20px;
  left: 0px;
  top: 31px;

  font-family: Noto Sans KR;
  font-style: normal;
  font-weight: normal;
  font-size: 14px;
  line-height: 20px;
  border: none;

  /* Gray 3 */

  color: #828282;
`;

const ContentInput = ({ type = "text", ...props }) => (
  <StyledInput type={type} {...props} />
);

export default ContentInput;
