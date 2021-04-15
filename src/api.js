function api() {
  const URL = "https://codesquad-2021-api.herokuapp.com/todo/v3";
  const api = (method, data = "", suffix = "") => {
    const req = {
      method,
      headers: {
        "Content-Type": "application/json",
      },
    };
    if (data) req.body = JSON.stringify(data);
    return fetch(URL + suffix, req);
  };
  return async (method, data) => {
    const result =
      method === "get"
        ? await api("get", "", `/${data}`)
        : await api(method, data);
    let json = await result.json();
    if (!json || json.length === 0) json = null;
    return json;
  };
}

export default api();
