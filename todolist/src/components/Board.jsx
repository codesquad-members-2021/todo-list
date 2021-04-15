import Column from "./column/Column";
import styled from "styled-components";
import { useEffect, useState } from "react";
import Button from "./utils/Button";

const BoardBlock = styled.div`
  display: flex;
  background: tan;
`;

const tempData = [
  {
    columnId: 12314,
    columnTitle: "해야할 일",
    items: [
      {
        cardId: 424124,
        cardTitle: "temp title1",
        content: "졸리다 졸려",
      },
      {
        cardId: 251124,
        cardTitle: "temp title2",
        content: "임시 내용22",
      },
    ],
  },
  {
    columnId: 211234,
    columnTitle: "하는 중",
    items: [
      {
        cardId: 30756,
        cardTitle: "board 작성 중",
        content: "board를 작성하고 있습니다.",
      },
    ],
  },
  {
    columnId: 36431,
    columnTitle: "끝난거~",
    items: [
      {
        cardId: 4516864,
        cardTitle: "던던",
        content: "더러더러더더던",
      },
      {
        cardId: 223575,
        cardTitle: "임시 카드",
        content: "임시 내용2",
      },
    ],
  },
];

export default function Board({ onLog }) {
  const [columns, setColumns] = useState(tempData);

  useEffect(() => {
    fetch("http://localhost:3000/setData", {
      method: "post",
      headers: {
        "Content-type": "application/json",
      },
      body: JSON.stringify(columns),
    });
  }, [columns]);

  const addColumn = () => {
    const column = {
      columnId: Date.now(),
      columnTitle: "new column",
      items: [],
    };
    setColumns([...columns, column]);
  };

  const setItemsOfColumn = (column) => {
    const target = columns.find((e) => e.columnId === column.columnId);
    target.items = [...column.items];
    setColumns([...columns]);
  };

  return (
    <BoardBlock>
      {columns.map((column) => (
        <Column
          onLog={onLog}
          key={column.columnId}
          column={column}
          columns={columns}
          setItemsOfColumn={setItemsOfColumn}
        />
      ))}
      <Button type="add" subType="bigSize" onClick={addColumn} />
    </BoardBlock>
  );
}
