import React, { useState } from 'react';
import axios from "axios";
import Card from "../../../../components/main/column/card/Card";
import PopupModal from "../../../../components/common/PopupModal";

const CardContainer = ({ title, body, index, setCardList, columnId, cardId, previousCardId }) => {
    const [isCardDelHover, setIsCardDelHover] = useState(false);
    const [isPopubVisible, setIsPopubVisible] = useState(false);

    const onClickDeleteCardHandler  = () => setIsPopubVisible(true);
    const onDoubleClickEditCardHandler = () => {
        setCardList((cardList) => {
            const left = cardList.slice(0, index);
            const right = cardList.slice(index + 1);
            return left.concat({ title, body, isInput: true, previousCardId, cardId, columnId }, right);
        });
    };

    const onMouseEnterHandler = () => setIsCardDelHover(true);
    const onMouseLeaveHandler = () => setIsCardDelHover(false);

    const data = { title, body };
    const onEventsCard = {
        onClickDeleteCardHandler,
        onDoubleClickEditCardHandler,
        onMouseEnterHandler,
        onMouseLeaveHandler,
    };

    // Popup Events
    // 팝업에서 확인버튼 -> 카드 삭제
    const onClickPopupConfirm = () => {
        setCardList((cardList) => cardList.filter((_, i) => i !== index))
        axios.delete(`api/columns/${columnId}/cards/${cardId}`);
        setIsPopubVisible(false);
    };
    const onClickPopupCancel = () => setIsPopubVisible(false);

    return (
        <>
            <Card data={data} isCardDelHover={isCardDelHover} onEvents={onEventsCard} />
            <PopupModal
                isVisible={isPopubVisible}
                cancelClickHandler={onClickPopupCancel}
                confirmClickHandler={onClickPopupConfirm}
            />
        </>
    );
};

export default CardContainer;
