// server.js
const shortid = require("shortid");

const jsonServer = require("json-server");
const server = jsonServer.create();
const router = jsonServer.router("db.json");
const middlewares = jsonServer.defaults();

// db.json를 조작하기 위해 lowdb를 사용
const low = require("lowdb");
const FileSync = require("lowdb/adapters/FileSync");
const adapter = new FileSync("db.json");
const db = low(adapter);
// Set default middlewares (logger, static, cors and no-cache)
server.use(middlewares);
server.use(jsonServer.bodyParser);
// Add custom routes before JSON Server router

server.patch("/todos", (req, res) => {
  const { columnId, id, title, content } = req.body;
  db.get("todos")
    .find((e) => e.columnId === Number(columnId))
    .get("items")
    .find((e) => e.id === Number(id))
    .assign({ title: title, content: content })
    .write();

  res.send(db.get("todos").value());
});

server.put("/todos", (req, res) => {
  const { columnId, title, content, author } = req.query; //id 어떻게 할당?
  console.log(columnId, title, content);
  const test = db
    .get("todos")
    .find((e) => e.columnId === Number(columnId))
    .get("items")
    .push({ id: shortid.generate(), title, content, author })
    .write();
  res.send(db.get("todos").value());
});

server.delete("/todos", (req, res) => {
  const { columnId, id } = req.query;
  db.get("todos")
    .find((e) => e.columnId === Number(columnId))
    .get("items")
    .remove((e) => e.id === Number(id))
    .write();
  res.send(db.get("todos").value());
  // lowdb를 사용해서 db.json에서 completed: true인 todo를 제거
  // db.get("todos").remove({ completed: true }).write();
  // res.send(db.get("todos").value());
});

// Use default router
server.use(router);

server.listen(5000, () => {
  console.log("JSON Server is running");
});
