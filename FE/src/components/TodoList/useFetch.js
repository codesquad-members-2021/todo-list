import axios from 'axios';

const requestPost = async (path, cardData) => {
  try {
    return await axios.post(path, cardData);
  } catch (error) {
    console.error(error);
  }
};

const postForm = async (path, formData, column, callback) => {
  const res = await requestPost(path, formData);
  const newCard = res.data;
  const cardAdded = [...column.cards, newCard];
  column.cards = cardAdded;
  callback(column);
};

const deleteCard = async (path, currentColumns, newColumn, setColumnData) => {
  try {
    await axios.delete(path);
    const updatedColumns = currentColumns.map((curColumn) =>
      curColumn.id === newColumn.id ? newColumn : curColumn
    );
    setColumnData([...updatedColumns]);
  } catch (error) {
    console.error(error);
  }
};

const deleteColumn = async (path) => {
  try {
    await axios.delete(path);
  } catch (error) {
    console.error(error);
  }
};

const putForm = async (path, formData, setInputs) => {
  const res = await axios.put(path, formData);
  const newCard = res.data;
  setInputs({
    title: newCard.title,
    content: newCard.content,
  });
};

const postColumn = async (path, formData, columnData, callback) => {
  const response = await axios.post(path, formData);
  const columnToAdd = response.data;
  callback([...columnData, columnToAdd]);
};

export { postColumn, postForm, deleteCard, putForm, deleteColumn };
