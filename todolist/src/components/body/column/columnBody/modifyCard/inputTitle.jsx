import React from "react";

const InputTitle = ({ handleButtonFlag }) => {
  return (
    <div className="input-title-section">
      <input
        onChange={handleButtonFlag}
        className="input-title"
        type="text"
        placeholder="제목을 입력하세요"
      ></input>
    </div>
  );
};

export default InputTitle;
