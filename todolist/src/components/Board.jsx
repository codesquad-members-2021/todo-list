import Column from "./column/Column";
import styled from "styled-components";

const BoardBlock = styled.div`
  display: flex;
  background: tan;
`;

const columns = [
  {
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
];
export default function Board({ onLog }) {
  return (
    <BoardBlock>
      {columns.map((column) => (
        <Column onLog={onLog} column={column} />
      ))}
    </BoardBlock>
  );
}
