import React, { useState } from "react";
import CardForm from "./CardForm";
import CardWrap from "./CardWrap";
import styled from "styled-components";
import { HiOutlinePlusSm } from "react-icons/hi";

const ColumnContainer = styled.section`
  width: 308px;
  margin-right: 1em;
`;

const ColumnTitle = styled.div`
  position: static;
  height: 26px;
  left: 0px;
  top: 0px;
  font-weight: bold;
  font-size: 18px;
  line-height: 26px;

  /* identical to box height */
  display: flex;
  justify-content: space-between;

  /* Black */
  color: #010101;
  border: 1px solid #bdbdbd;

  /* Inside Auto Layout */
  flex: none;
  order: 0;
  flex-grow: 0;
  margin: 0px 8px;
`;

const ColumnCount = styled.div`
  display: inline-block;
  width: 26px;
  height: 26px;
  border-radius: 50%;

  font-weight: bold;
  font-size: 14px;
  line-height: 25px;
  text-align: center;

  /* Black */
  color: #010101;
  background: #bdbdbd;

  /* Inside Auto Layout */
  margin: 0px 10px;
`;

function Column(props) {
  // 임시 컬럼
  const [cards, setCards] = useState([
    {
      id: 1,
      title: "임시 카드",
      content: "임시 내용",
    },
  ]);
  const { onLog } = props;

  const [enrollMode, setEnrollMode] = useState(false);

  const handleCreate = (card) => {
    setEnrollMode(!enrollMode);
    setCards(cards.concat(card));
    onLog({
      cardTitle: card.title,
      columnTitle: "하고 있는 일",
      modeType: "add",
    });
  };

  const handleCancel = (e) => {
    e.preventDefault();
    setEnrollMode(!enrollMode);
  };

  const handleDelete = (target) => {
    setCards(cards.filter((e) => e.id !== target.id));
    onLog({
      cardTitle: target.title,
      columnTitle: "하고 있는 일",
      modeType: "delete",
    });
  };

  const handleUpdate = ({ id, title, content }) => {
    const card = cards.find((e) => e.id === id);
    card.title = title;
    card.content = content;
    setCards(cards);
    onLog({
      cardTitle: title,
      columnTitle: "하고 있는 일",
      modeType: "update",
    });
  };

  return (
    <ColumnContainer>
      <header>
        <ColumnTitle>해야할 일</ColumnTitle>
        <ColumnCount>{cards.length}</ColumnCount>
        <HiOutlinePlusSm onClick={() => setEnrollMode(!enrollMode)}></HiOutlinePlusSm>
      </header>
      {enrollMode ? <CardForm onSubmit={handleCreate} onCancel={handleCancel} onLog={onLog} /> : ""}
      <CardList cards={cards} onDelete={handleDelete} onUpdate={handleUpdate} />
    </ColumnContainer>
  );
}

function CardList(props) {
  const { cards, onDelete, onUpdate } = props;
  return (
    <ul className="card-wrap">
      {cards.map((card) => (
        <CardWrap key={card.id} card={card} onDelete={onDelete} onUpdate={onUpdate} />
      ))}
    </ul>
  );
}

export { CardList, Column };
