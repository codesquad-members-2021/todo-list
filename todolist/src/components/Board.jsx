import Column from "./column/Column";
import styled from "styled-components";
import { useEffect, useState } from "react";
import Button from "./utils/Button";
import { URL } from "./utils/constant";

const BoardBlock = styled.div`
  display: flex;
  background: tan;
`;

const mockData = [
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
];

export default function Board({ onLog }) {
  const [columns, setColumns] = useState([]);

  useEffect(async () => {
    if (columns.length === 0) {
      const data = await fetch(URL.getDB);
      const json = await data.json();
      setColumns((json[0].columnList.length && json[0].columnList) || mockData);
      return;
    }
    await fetch(URL.setDB, {
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
        <Column onLog={onLog} key={column.columnId} column={column} setItemsOfColumn={setItemsOfColumn} />
      ))}
      <Button type="add" subType="bigSize" onClick={addColumn} />
    </BoardBlock>
  );
}
