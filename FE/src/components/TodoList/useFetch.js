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
  const cardAdded = [newCard, ...column.cards];
  column.cards = cardAdded;
  callback(column);
};

export { postForm };
