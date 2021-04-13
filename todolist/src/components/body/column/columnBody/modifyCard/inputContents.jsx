import React from "react";
import {
  InputContentsSection,
  InputContentsTextarea,
} from "./inputContents.style.jsx";

const InputContents = ({ handleChangeContents, handleButtonFlag }) => {
  return (
    <InputContentsSection className="input-contents-section">
      <InputContentsTextarea
        onKeyUp={(e) => {
          handleButtonFlag(e);
          handleChangeContents(e);
        }}
        className="input-contents"
        type="text"
        placeholder="내용을 입력하세요"
      ></InputContentsTextarea>
    </InputContentsSection>
  );
};

export default InputContents;
