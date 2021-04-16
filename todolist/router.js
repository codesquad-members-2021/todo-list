const router = require("express").Router();
const mySchema = require("./mySchema");
const dotenv = require("dotenv");
require("./DB");

dotenv.config();

router.get("/getData", function (req, res) {
  console.log("mySchema 요청!");
  mySchema.find({ _id: process.env.COLLECTION_ID }, function (err, result) {
    res.send(result);
  });
});

router.post("/setData", function (req, res) {
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
