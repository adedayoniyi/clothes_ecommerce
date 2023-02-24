const express = require("express");
const admin = require("../middlewares/admin");
const Product = require("../models/product");
const productRouter = express.Router();

productRouter.post("/admin/add-product", admin, async (req, res) => {
  try {
    const { name, description, price, quantity, category, images } = req.body;
    let product = new Product({
      name,
      description,
      price,
      quantity,
      images,
      category,
    });
    product = await product.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
