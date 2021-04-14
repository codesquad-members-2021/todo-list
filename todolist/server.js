const express = require("express");
const dotenv = require("dotenv");
const router = require("./router");
const cors = require("cors");

dotenv.config();
const app = express();

app.use(express.json());
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use("/", router);

app.listen(process.env.PORT, function () {
  console.log(`서버 켜져있어요! port: ${process.env.PORT}`);
});
