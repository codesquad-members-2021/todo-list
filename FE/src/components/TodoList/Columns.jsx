import { useState } from 'react';
import CardLists from './CardLists';
import Form from './Form';
import styled from 'styled-components';
import Icon from '../atoms/Icons';
import PopUp from '../atoms/PopUp';
import { deleteCard, deleteColumn } from './useFetch.js';

const Column = ({ todoData }) => {
  const [columnData, setColumnData] = useState(todoData);
  const [currentID, setCurrentID] = useState(null);
  const [isDeleteBtnClicked, SetIsDeleteBtnClicked] = useState(false);
  const [newColumns, setNewColumns] = useState({
    column: [],
    cardID: null,
  });

  const handleClick = (clickedID) => {
    return () => {
      if (currentID !== clickedID) setCurrentID(clickedID);
      else if (currentID !== null) setCurrentID(null);
      else setCurrentID(clickedID);
    };
  };

  const handleClickDeleteBtn = (deletedID) => {
    return () => {
      const path = `boards/${deletedID}`;
      deleteColumn(path);
      const newColumn = columnData.filter(({ id }) => id !== deletedID);
      setColumnData([...newColumn]);
    };
  };

  const addCard = (column) => {
    setColumnData(Object.assign(columnData, column));
  };

  const rewind = () => SetIsDeleteBtnClicked(!isDeleteBtnClicked);

  const offDisplay = () => {
    setCurrentID(null);
  };

  const handleClickDelete = async (newColumns) => {
    const { column, cardID } = newColumns;
    const path = `${column.id}/cards/${cardID}`;
    deleteCard(path, columnData, column, setColumnData);
    rewind();
  };

  const checkInputValue = ({ title, content }, callbackSetInput) => {
    if (title.length > 0 || content.length > 0) callbackSetInput(true);
    else callbackSetInput(false);
  };

  const columnList = columnData.map((column) => {
    const { id, title, cards } = column;
    return (
      <section key={id} className="column">
        <ul>
          <header className="column__header">
            <div className="title">
              <h2 className="title__h2">{title}</h2>
              <span className="title__icon">{cards.length}</span>
            </div>
            <div className="column_button-wrap">
              <button onClick={handleClick(id)}>
                <Icon type="plus" />
              </button>
              <button onClick={handleClickDeleteBtn(id)}>
                <Icon type="cancel" />
              </button>
            </div>
          </header>
          <div>
            {currentID === id && (
              <Form
                key={id}
                addCard={addCard}
                offDisplay={offDisplay}
                column={column}
                checkInputValue={checkInputValue}
              />
            )}
            <CardLists
              key={id + title}
              column={column}
              cards={cards}
              checkInputValue={checkInputValue}
              SetIsDeleteBtnClicked={SetIsDeleteBtnClicked}
              setNewColumns={setNewColumns}
            />
          </div>
        </ul>
      </section>
    );
  });

  return (
    <>
      <ColumnContainer>{columnList}</ColumnContainer>
      <PopUp
        isDeleteBtnClicked={isDeleteBtnClicked}
        rewind={rewind}
        newColumns={newColumns}
        handleClickDelete={handleClickDelete}
      />
    </>
  );
};

export default Column;

const ColumnWrap = styled.div`
  display: flex;

  button {
    outline: 0;
    border: 0;
  }

  .column {
    width: 308px;
    padding-right: 1rem;
  }

  .column__header {
    display: flex;
    padding-bottom: 1rem;
    justify-content: space-between;
    align-items: center;
  }

  .title {
    display: flex;
    align-items: center;
    height: 26px;
    width: 228px;
  }

  .title__h2 {
    width: auto;
    height: 26px;

    font-family: Noto Sans KR;
    font-style: normal;
    font-weight: bold;
    font-size: 18px;
    line-height: 26px;
    display: flex;
    align-items: center;
    color: #010101;
  }

  .title__icon {
    margin-left: 5px;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 0px;
    position: static;
    width: 26px;
    height: 26px;
    background: #bdbdbd;
    border-radius: 20px;
  }

  .column_button-wrap {
    display: flex;
  }
`;

const ColumnContainer = ({ children }) => <ColumnWrap>{children}</ColumnWrap>;
