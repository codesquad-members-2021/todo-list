const mongoose = require("mongoose");
const mySchema = mongoose.model(
  "user",
  new mongoose.Schema({
    columnList: Array,
  })
);

module.exports = mySchema;
