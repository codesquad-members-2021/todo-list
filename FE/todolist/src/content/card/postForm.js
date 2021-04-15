import axios from 'axios';

const postForm = async (columnData, path) => {
    try { await axios.post(path, columnData) }
    catch (error) { console.error(error); }
}

export default postForm;