import axios from "axios";

const loadItems = async (setState, url) => {
  const { data } = await axios.get(url);
  setState(data);
};

export default loadItems;