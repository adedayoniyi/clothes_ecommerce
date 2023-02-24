const jwt = require("jsonwebtoken");
const auth = async (req, res, next) => {
  try {
    const token = req.header("x-auth-token");
    if (!token) return res.status(401).json({ msg: "No token, access denied" });
    const verified = jwt.verify(token, process.env.TOKEN_STRING);
    if (!verified)
      return res
        .status(401)
        .json({ msg: "Token verification failed,access denied" });
    req.user = verified.id;
    req.token = token;
    //going to the next api route
    next();
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
module.exports = auth;
