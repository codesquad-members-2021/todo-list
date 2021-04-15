function tmp() {
  const URL = "https://codesquad-2021-api.herokuapp.com/todo/v2";
  const api = (method, data = "", suffix = "") => {
    const req = {
      method,
      headers: {
        "Content-Type" : "application/json",
      }
    }
    if(data) req.body = JSON.stringify(data);
    return fetch(URL + suffix, req);
  }
  return async (method, data) => {
    const result = method === "get" ? await api("get", "", `/${data}`) : await api(method, data);
    return await result.json();
  };
};

export default tmp();