import { useState } from 'react';
import { ColumnContainer } from './columnStyle';
import CardLists from '../atoms/CardLists';
import Form from './Form';

const Column = ({ data: { columns } }) => {
  const [columnData, setColumnData] = useState(columns);
  const [currentID, setCurrentID] = useState(null);

  const handleClick = (clickedID) => {
    return () => {
      if (currentID !== clickedID) setCurrentID(clickedID);
      else if (currentID !== null) setCurrentID(null);
      else setCurrentID(clickedID);
    };
  };

  const handleClickDeleteBtn = (deletedID) => {
    return () => {
      const newColumn = columnData.filter(({ id }) => id !== deletedID);
      setColumnData([...newColumn]);
    };
  };

  const addCard = (column) => {
    setColumnData(Object.assign(columnData, column));
  };

  const offDisplay = () => {
    setCurrentID(null);
  };

  const columnList = columnData.map((column) => {
    const { id, title, cards } = column;
    return (
      <section key={id}>
        <ul>
          <header>
            <span>{title}</span>
            <span>{cards.length}개</span>
            <button onClick={handleClick(id)}>
              <i className="fas fa-plus"></i>
            </button>
            <button onClick={handleClickDeleteBtn(id)}>
              <i className="fas fa-times"></i>
            </button>
          </header>
          <div>
            {currentID === id && (
              <Form
                key={id}
                addCard={addCard}
                offDisplay={offDisplay}
                column={column}
              />
            )}
            <CardLists cards={cards} />
          </div>
        </ul>
      </section>
    );
  });

  return <ColumnContainer>{columnList}</ColumnContainer>;
};

export default Column;
