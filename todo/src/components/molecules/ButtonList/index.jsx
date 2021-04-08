import React from "react";
import Span from "../../atoms/Span";
import Image from "../../atoms/Image";
import SmallButton from "../../atoms/SmallButton";
import MediumButton from "../../atoms/MediumButton";
import PlusButtonImg from "../../../images/plusButton.svg"
import CloseButtonImg from "../../../images/closeButton.svg"

const ButtonList = ({ isIcon }) => {
  const plusButton = <SmallButton><Image src={PlusButtonImg} imgWidth="23px" /></SmallButton>;
  const closeButton = <SmallButton><Image src={CloseButtonImg} imgWidth="20px" /></SmallButton>;
  const cancelButtons = <MediumButton BtnColor="#fff" textColor="#3c4243">취소</MediumButton>
  const enrollButtons = <MediumButton BtnColor="#62afb7" textColor="white">등록</MediumButton>
  const currentButton = isIcon ? <>{plusButton}{closeButton}</> : <>{cancelButtons}{enrollButtons}</>;
    return (
      <Span>
        {currentButton}
        </Span>
    );
};

export default ButtonList;
