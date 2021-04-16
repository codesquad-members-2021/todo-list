const mongoose = require("mongoose");

const mySchema = mongoose.model(
  "todolist",
  new mongoose.Schema({
    columnList: Array,
  })
);

module.exports = mySchema;
