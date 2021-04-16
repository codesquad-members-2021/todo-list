import { useState } from "react";
import styled from "styled-components";
import CardForm from "./card/CardForm";
import CardWrap from "./card/CardWrap";
import CardContainer from "./card/CardContainer.style";
import Button from "../utils/Button";
import { Droppable } from "react-beautiful-dnd";
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
const CardList = {
  minHeight: 300,
};

function Column({ onLog, column, setItemsOfColumn, deleteColumn }) {
  const [enrollMode, setEnrollMode] = useState(false);
  const { columnId, columnTitle, items } = column;

  const handleCreate = (card) => {
    setEnrollMode(!enrollMode);
    setItemsOfColumn({
      ...column,
      items: items.concat(card),
    });
    onLog({
      cardTitle: card.cardTitle,
      columnTitle,
      modeType: "add",
      publishedTime: Date.now(),
    });
  };

  const handleCancel = (e) => {
    e.preventDefault();
    setEnrollMode(!enrollMode);
  };

  const handleDelete = ({ cardId, cardTitle }) => {
    setItemsOfColumn({
      ...column,
      items: items.filter((e) => e.cardId !== cardId),
    });
    onLog({
      cardTitle: cardTitle,
      columnTitle,
      modeType: "delete",
      publishedTime: Date.now(),
    });
  };

  const handleUpdate = ({ cardId, cardTitle, content }) => {
    const newCards = items.map((card) => {
      return card.cardId !== cardId ? card : { ...card, cardTitle, content };
    });
    setItemsOfColumn({ ...column, items: newCards });
    onLog({
      cardTitle,
      columnTitle,
      modeType: "update",
      publishedTime: Date.now(),
    });
  };

  return (
    <ColumnContainer>
      <ColumnMenu>
        <ColumnTitle>
          <div>{columnTitle}</div>
          <ColumnCount>{items.length}</ColumnCount>
        </ColumnTitle>
        <Button onClick={() => setEnrollMode(!enrollMode)} type="add" />
        <Button onClick={() => deleteColumn(columnId)} type="delete" />
      </ColumnMenu>
      {enrollMode && (
        <CardContainer>
          <CardForm
            onSubmit={handleCreate}
            onCancel={handleCancel}
            onLog={onLog}
          />
        </CardContainer>
      )}
      <Droppable droppableId={String(columnId)}>
        {(provided) => (
          <div
            {...provided.droppableProps}
            ref={provided.innerRef}
            style={CardList}
          >
            {items.map((card, index) => (
              <CardWrap
                key={card.cardId}
                id={card.cardId}
                card={card}
                index={index}
                onDelete={handleDelete}
                onUpdate={handleUpdate}
              />
            ))}
          </div>
        )}
      </Droppable>
    </ColumnContainer>
  );
}

export default Column;
