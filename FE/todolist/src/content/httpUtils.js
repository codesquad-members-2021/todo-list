import axios from 'axios';

const requestGet = async (path) => {
    try { return await axios.get(path); } 
    catch (error) { console.error(error); }
};
 
const initFetchData = async (callback, path, keyName) => {
    const response = await requestGet(path);
    const data = response.data;
    if(data) callback(data[keyName])
}

const requestPost = async (cardData, path) => {
    try { return await axios.post(path, cardData) }
    catch (error) { console.error(error); }
}

const postForm = async (callback, columnData, cardData, path) => {
    const response = await requestPost(cardData, path);
    const data = response.data;
    cardData ={...cardData, id: data.cardId}
    callback({ ...columnData, cardList : [...columnData.cardList, cardData]})
}

const deleteCard = async (path) => {
    try { await axios.delete(path, {"deleted": "true"}) }
    catch (error) { console.error(error); }
}

export { initFetchData, postForm, deleteCard }