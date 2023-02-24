const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");
require("dotenv").config();
const app = express();

const PORT = process.env.PORT;
const DB = process.env.MONGO_URL;
app.use(express.json());
app.use(authRouter);

mongoose
  .connect(DB)
  .then(() => {
    console.log("MongoDB connection successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Connected at port ${PORT}`);
});
