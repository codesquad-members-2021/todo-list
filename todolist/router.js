const router = require("express").Router();
const mySchema = require("./mySchema");
const dotenv = require("dotenv");
require("./DB");

dotenv.config();

router.get("/todolist", function (req, res) {
  console.log("mySchema 요청!");
  mySchema.find({ _id: process.env.COLLECTION_ID }, function (err, result) {
    console.log(process.env.COLLECTION_ID, result);
    res.send(result);
  });
});

router.post("/setData", function (req, res) {
  console.log(req.body);
  mySchema.updateOne(
    { _id: process.env.COLLECTION_ID },
    { $set: { columnList: req.body } },
    (err, result) => {
      if (err) console.error(err);
      res.send("잘 들어감");
    }
  );
});

module.exports = router;
