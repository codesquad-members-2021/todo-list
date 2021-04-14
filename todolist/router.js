const router = require("express").Router();
const mySchema = require("./mySchema");
const dotenv = require("dotenv");
require("./DB");

dotenv.config();

router.get("/", function (req, res) {
  console.log("book 요청!");
  res.send("정상처리");
});

// mySchema.find({ content: "정신차려" }, function (err, tests) {
//   console.log(tests);
// });

router.post("/setData", function (req, res) {
  // console.log("req.body", req.body);
  // console.log(Array.isArray(req.body));
  mySchema.updateOne({ _id: process.env.COLLECTION_ID }, { $set: { columnList: req.body } }, (err, result) => {
    err ? console.log("err", err) : console.log("result:", result);
    res.send("잘 들어감");
  });
});
//   const todolist = new mySchema({
//     columList: req.body,
//   });
//   todolist.save((err, result) => {
//     err ? console.log(err) : console.log(result);
//     res.send("데이터 잘 들어감");
//   });
// });

// const test = new mySchema(req.body);
// test.save(function (err, result) {
//   if (err) {
//     console.log(err);
//   } else {
//     console.log(result);
//   }
//   res.send("정상처리");
// });

module.exports = router;
