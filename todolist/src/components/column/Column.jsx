import { useState } from "react";
import styled from "styled-components";
import CardForm from "./card/CardForm";
import CardList from "./card/CardList";
import CardContainer from "./card/CardContainer.style";
import IconButton from "../utils/IconButton";

const ColumnContainer = styled.section`
  width: 308px;
  margin-right: 1em;
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
      <ColumnMenu>
        <ColumnTitle>
          <div>해야할 일</div>
          <ColumnCount>{cards.length}</ColumnCount>
        </ColumnTitle>
        <IconButton cb={() => setEnrollMode(!enrollMode)} type="add" />
      </ColumnMenu>
      {enrollMode ? (
        <CardContainer>
          <CardForm onSubmit={handleCreate} onCancel={handleCancel} onLog={onLog} />
        </CardContainer>
      ) : (
        ""
      )}
      <CardList cards={cards} onDelete={handleDelete} onUpdate={handleUpdate} />
    </ColumnContainer>
  );
}

export default Column;
