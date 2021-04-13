import React from "react";

const RegistButton = ({ postCardData, buttonFlag }) => {
  return (
    <div className="regist-button-section">
      <button
        onClick={postCardData}
        disabled={buttonFlag}
        className="regist-button"
      >
        등록
      </button>
    </div>
  );
};

export default RegistButton;
