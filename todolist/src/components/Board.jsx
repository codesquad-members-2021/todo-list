import Column from "./column/Column";
import styled from "styled-components";
import { useEffect, useState } from "react";
import Button from "./utils/Button";
import { URL } from "./utils/constant";
import { DragDropContext } from "react-beautiful-dnd";
const BoardBlock = styled.div`
  display: flex;
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
  const [columns, setColumns] = useState(mockData);

  useEffect(async () => {
    const data = await fetch(URL.getDB);
    const json = await data.json();
    setColumns((json[0].columnList.length && json[0].columnList) || mockData);
  }, []);

  useEffect(async () => {
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
    setColumns((columns) => [...columns, column]);
  };
  const deleteColumn = (columnId) => {
    setColumns((columns) =>
      columns.filter((column) => column.columnId !== columnId)
    );
  };
  const setItemsOfColumn = (column) => {
    const target = columns.find((e) => e.columnId === column.columnId);
    target.items = [...column.items];
    setColumns((columns) => [...columns]);
  };
  const onDragEnd = (result) => {
    if (!result.destination) return;
    const { droppableId: beforeColumnId, index: beforeIndex } = result.source;
    const {
      droppableId: afterColumnId,
      index: afterIndex,
    } = result.destination;

    let targetItem = {};
    for (const column of columns) {
      if (column.columnId === +beforeColumnId) {
        targetItem = column.items.splice(beforeIndex, 1)[0];
      }
    }
    const newColumns = columns.map((column) => {
      const newColumn = {
        ...column,
        items: [...column.items],
      };
      if (column.columnId === +afterColumnId) {
        console.log("aa");
        newColumn.items.splice(afterIndex, 0, targetItem);
      }
      return newColumn;
    });
    setColumns(newColumns);
  };
  const onDragEnd = (result) => {
    if (!result.destination) return;
    const { droppableId: beforeColumnId, index: beforeIndex } = result.source;
    const {
      droppableId: afterColumnId,
      index: afterIndex,
    } = result.destination;

    let targetItem = {};
    for (const column of columns) {
      if (column.columnId === +beforeColumnId) {
        targetItem = column.items.splice(beforeIndex, 1)[0];
      }
    }
    const newColumns = columns.map((column) => {
      const newColumn = {
        ...column,
        items: [...column.items],
      };
      if (column.columnId === +afterColumnId) {
        console.log("aa");
        newColumn.items.splice(afterIndex, 0, targetItem);
      }
      return newColumn;
    });
    console.log(newColumns);
    setColumns(newColumns);
  };

  return (
    <DragDropContext onDragEnd={onDragEnd}>
      <BoardBlock>
        {columns.map((column) => (
          <Column
            onLog={onLog}
            key={column.columnId}
            column={column}
            setItemsOfColumn={setItemsOfColumn}
            deleteColumn={deleteColumn}
          />
        ))}
        <Button type="add" subType="bigSize" onClick={addColumn} />
      </BoardBlock>
    </DragDropContext>
  );
}
