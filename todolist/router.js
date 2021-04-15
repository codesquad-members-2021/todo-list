const router = require("express").Router();
const mySchema = require("./mySchema");
const dotenv = require("dotenv");
require("./DB");

dotenv.config();

router.get("/getData", function (req, res) {
  console.log("mySchema 요청!");
  mySchema.find({ _id: process.env.COLLECTION_ID }, function (err, result) {
    console.log(process.env.COLLECTION_ID, result);
    res.send(result);
  });
});

// const tmp = {
//   columnList: [
//     {
//       columnId: 12314,
//       columnTitle: "해야할 일",
//       items: [
//         {
//           cardId: 424124,
//           cardTitle: "temp title1",
//           content: "졸리다 졸려",
//         },
//         {
//           cardId: 251124,
//           cardTitle: "temp title2",
//           content: "임시 내용22",
//         },
//       ],
//     },
//   ],
// };

// const temp = new mySchema(tmp);
// temp.save(function (err, res) {
//   console.log(err);
//   console.log(res);
// });

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
