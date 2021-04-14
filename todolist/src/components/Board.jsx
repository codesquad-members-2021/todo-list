import Column from "./column/Column";
import styled from "styled-components";
import { useEffect, useState } from "react";

const BoardBlock = styled.div`
  display: flex;
  background: tan;
`;

export default function Board({ onLog }) {
  const [columns, setColumns] = useState([
    {
      id: 1,
      title: "해야할 일",
      items: [
        {
          id: 1,
          title: "temp title1",
          content: "졸리다 졸려",
        },
        {
          id: 2,
          title: "temp title2",
          content: "임시 내용22",
        },
      ],
    },
    {
      id: 2,
      title: "하는 중",
      items: [
        {
          id: 3,
          title: "board 작성 중",
          content: "board를 작성하고 있습니다.",
        },
      ],
    },
    {
      id: 3,
      title: "끝난거~",
      items: [
        {
          id: 4,
          title: "던던",
          content: "더러더러더더던",
        },
        {
          id: 5,
          title: "임시 카드",
          content: "임시 내용2",
        },
      ],
    },
  ]);

  // useEffect(() => {
  //   fetch("http://localhost:4000/setData", {
  //     method: "post",
  //     headers: {
  //       "Content-type": "application/json",
  //     },
  //     body: JSON.stringify(columns),
  //   });
  // }, [columns]);

  const setItemsOfColumn = (column) => {
    console.log("column", column);
    const target = columns.find((e) => e.id === column.id);
    target.items = [...column.items];
    setColumns([...columns]);
  };

  return (
    <BoardBlock>
      {columns.map((column) => (
        <Column onLog={onLog} col={column} columns={columns} setItemsOfColumn={setItemsOfColumn} />
      ))}
    </BoardBlock>
  );
}
