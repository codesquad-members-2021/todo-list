const router = require("express").Router();
const mySchema = require("./mySchema");
const dotenv = require("dotenv");
require("./DB");

dotenv.config();

router.get("/", function (req, res) {
  console.log("mySchema 요청!");
  res.send("정상처리");
});

router.post("/setData", function (req, res) {
  mySchema.updateOne(
    { _id: process.env.COLLECTION_ID },
    { $set: { columnList: req.body } },
    (err, result) => {
      err ? console.log("err", err) : console.log("result:", result);
      res.send("잘 들어감");
    }
  );
});

module.exports = router;
