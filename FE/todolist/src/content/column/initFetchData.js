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

export default initFetchData;