const mongoose = require("mongoose");
const dotenv = require("dotenv");
dotenv.config();

mongoose.set("useUnifiedTopology", true);

module.exports = mongoose.connect(process.env.MONGO_URL, function (err) {
  console.log(`error : ${err}`);
});
