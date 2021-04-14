import { useEffect, useState } from "react";
import styled from "styled-components";
import CardForm from "./card/CardForm";
import CardList from "./card/CardList";
import CardContainer from "./card/CardContainer.style";
import Button from "../utils/Button";

const ColumnContainer = styled.section`
  width: 308px;
  margin-right: 2em;
`;

const ColumnMenu = styled.div`
  height: 26px;
  left: 0px;
  top: 0px;
  font-weight: bold;
  font-size: 18px;
  line-height: 26px;
  display: flex;
  justify-content: space-between;
  margin: 0px 8px;
`;

const ColumnTitle = styled.span`
  display: flex;
`;

const ColumnCount = styled.div`
  width: 26px;
  height: 26px;
  border-radius: 50%;
  font-weight: bold;
  font-size: 14px;
  line-height: 25px;
  text-align: center;
  color: #010101;
  background: #bdbdbd;
  margin: 0px 10px;
`;

function Column({ onLog, col, columns, setItemsOfColumn }) {
  const { title, items } = col;
  // const [cards, setCards] = useState(items);
  const [enrollMode, setEnrollMode] = useState(false);
  const [column, setColumn] = useState(col);

  console.log(column);

  useEffect(() => {
    setItemsOfColumn(column);
    fetch("http://localhost:4000/setData", {
      method: "post",
      headers: {
        "Content-type": "application/json",
      },
      body: JSON.stringify(columns),
    });
  }, [column]);

  const handleCreate = (card) => {
    setEnrollMode(!enrollMode);
    // setCards(cards.concat(card));
    // column.items = cards;
    setColumn({ ...column, items: items.concat(card) });
    // console.log(column);
    // 변경된 column값을 전달해야 함
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
    // setCards(cards.filter((e) => e.id !== target.id));
    setColumn({ ...column, items: items.filter((e) => e.id !== target.id) });
    onLog({
      cardTitle: target.title,
      columnTitle: "하고 있는 일",
      modeType: "delete",
    });
  };

  const handleUpdate = ({ id, title, content }) => {
    const card = items.find((e) => e.id === id);
    card.title = title;
    card.content = content;
    setColumn({ ...column, items });
    // setCards(cards);
    onLog({
      cardTitle: title,
      columnTitle: "하고 있는 일",
      modeType: "update",
    });
  };

  return (
    <ColumnContainer>
      <ColumnMenu>
        <ColumnTitle>
          <div>{title}</div>
          <ColumnCount>{items.length}</ColumnCount>
        </ColumnTitle>
        <Button onClick={() => setEnrollMode(!enrollMode)} type="add" />
      </ColumnMenu>
      {enrollMode ? (
        <CardContainer>
          <CardForm onSubmit={handleCreate} onCancel={handleCancel} onLog={onLog} />
        </CardContainer>
      ) : (
        ""
      )}
      <CardList cards={items} onDelete={handleDelete} onUpdate={handleUpdate} />
    </ColumnContainer>
  );
}

export default Column;
