import React, { Fragment, useState } from "react";
import styled from "styled-components";
import Button from "../../utils/Button";
import { CardButtonSection, CardButton } from "./CardButton.style";

const CardTitle = styled.div`
  font-weight: bold;
  font-size: 16px;
  line-height: 23px;
  color: #010101;
  display: block;
`;

const CardContent = styled.span`
  font-size: 14px;
  line-height: 20px;
  color: #010101;
  height: 20px;
  margin: 8px 0px;
  overflow: hidden;
`;

const CardItem = styled.div`
  display: flex;
  justify-content: space-between;
  background: ${(props) => props.backgroundColor || "none"};
`;

const CardSection = styled.span`
  display: flex;
  flex-direction: column;
`;

const Modal = styled.div`
  all: unset;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  position: fixed;
  left: 0;
  top: 0;
`;

const ModalContent = styled.div`
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate3d(-50%, -50%, 0);
  width: 400px;
  height: 138px;
  background: #fff;
  border-radius: 6px;
`;

const ModalQuestion = styled.div`
  height: 50%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  text-align: center;
  font-weight: bold;
`;

function Card({ card, onDelete, cardContainer }) {
  const { cardTitle, content } = card;
  const [modalMode, setModalMode] = useState(false);
  const askToDelete = () => setModalMode(!modalMode);

  return (
    <>
      {modalMode && (
        <Modal>
          <ModalContent>
            <ModalQuestion>선택한 카드를 삭제할까요?</ModalQuestion>
            <CardButtonSection>
              <CardButton onClick={askToDelete} backgroundColor="#e0e0e0">
                취소
              </CardButton>
              <CardButton onClick={() => onDelete(card)} fontColor="#fff">
                삭제
              </CardButton>
            </CardButtonSection>
          </ModalContent>
        </Modal>
      )}
      <CardItem>
        <CardSection>
          <CardTitle className="card-title">{cardTitle}</CardTitle>
          <CardContent className="card-content">{content}</CardContent>
        </CardSection>
        <CardSection>
          <div
            onMouseOver={() => (cardContainer.current.style.backgroundColor = "red")}
            onMouseOut={() => (cardContainer.current.style.backgroundColor = "white")}
          >
            <Button type="delete" onClick={askToDelete} />
          </div>
        </CardSection>
      </CardItem>
    </>
  );
}

export default Card;
