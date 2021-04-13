import React from "react";

const InputContents = ({ handleButtonFlag }) => {
  return (
    <div className="input-contents-section">
      <textarea
        onChange={handleButtonFlag}
        className="input-contents"
        type="text"
        placeholder="내용을 입력하세요"
      ></textarea>
    </div>
  );
};

export default InputContents;
