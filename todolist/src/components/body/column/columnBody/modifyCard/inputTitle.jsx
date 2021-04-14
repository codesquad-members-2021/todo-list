import React from "react";
import { InputTitleSection, InputTitleTextarea } from "./inputTitle.style.jsx";

const InputTitle = ({ handleChangeTItle, handleButtonFlag }) => {
  return (
    <InputTitleSection className="input-title-section">
      <InputTitleTextarea
        onKeyUp={(e) => {
          handleButtonFlag(e);
          handleChangeTItle(e);
        }}
        className="input-title"
        type="text"
        placeholder="제목을 입력하세요"
      ></InputTitleTextarea>
    </InputTitleSection>
  );
};

export default InputTitle;
