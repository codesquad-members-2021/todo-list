import React from 'react';
import styled from 'styled-components';
import AccentButton from "./AccentButton";
import NormalButton from "./NormalButton";

const StyledPopupModal = styled.div`
    visibility: ${props => props.isVisible ? "visible" : "hidden"};

    --background-color: rgba(1, 1, 1, 0.4);
    background-color: var(--background-color);

    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: 9999;

    display: flex;
    justify-content: center;
    align-items: center;
`;

const Modal = styled.div`
    --background-color: #fff;
    background-color: var(--background-color);

    display: flex;
    flex-direction: column;
    justify-content: center;
    padding: 24px 48px;

    box-shadow: 0px 0px 4px rgba(204, 204, 204, 0.5),
        0px 2px 4px rgba(0, 0, 0, 0.25);
    backdrop-filter: blur(4px);
    border-radius: 6px;

    width: 400px;
    height: 138px;
`;

const Message = styled.p`
    --message-font-color: #010101;
    color: var(---message-font-color);
    font-family: Noto Sans KR;
    font-size: 16px;
    margin: 24px 0px;
`;

const ModalButtons = styled.div`
    display: flex;
    justify-content: flex-end;

    button + button {
        margin-left: 10px
    }
`;

const PopupModal = ({isVisible}) => {
    return (
        <StyledPopupModal isVisible={isVisible}>
            <Modal>
                <Message>선택한 카드를 삭제할까요?</Message>
                <ModalButtons>
                    <NormalButton>취소</NormalButton>
                    <AccentButton isAble>삭제</AccentButton>
                </ModalButtons>
            </Modal>
        </StyledPopupModal>
    );
};

export default PopupModal;
