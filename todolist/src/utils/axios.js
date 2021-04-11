import axios from "axios";

const getData = async (url) => {
	const data = await axios.get(url);
	return data;
}

const postData = (url, data) => {
	axios.post(url, data);
}

const patchData = (url, data) => {
	axios.patch(url, data)
}

const deleteData = (url) => {
	axios.delete(url)
}

const getRandomUser = async (url) => {
	const { data } = await axios.get(url)
	const randomUser = data[Math.floor(Math.random() * data.length)]
	return randomUser
}

export { getData, postData, patchData, deleteData, getRandomUser }