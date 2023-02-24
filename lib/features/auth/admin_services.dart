import 'dart:io';

import 'package:clothes_ecommerce/constants/error_handling.dart';
import 'package:clothes_ecommerce/constants/global_variables.dart';
import 'package:clothes_ecommerce/constants/utils.dart';
import 'package:clothes_ecommerce/models/product.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class AdminServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required String category,
    required double quantity,
    required List<File> images,
  }) async {
    final userProvider = Provider.of(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic("dq60qoglh", "by2b063b");
      //Mapping through the  images and sending them to cloudinary storage
      List<String> imageUrls = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
            //passing the folder name as the name of the product
            CloudinaryFile.fromFile(images[i].path, folder: name));
        imageUrls.add(res.secureUrl);
      }
      Product product = Product(
        name: name,
        description: description,
        images: imageUrls,
        category: category,
        price: price,
        quantity: quantity,
      );

      http.Response res = await http.post(
        Uri.parse("${GlobalVariables.uri}/admin/add-product"),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          'x-auth-token': userProvider.user.token,
        },
        body: product.toJson(),
      );

      httpErrorHandle(
          context: context,
          response: res,
          onSuccess: () {
            showSnackBar(context, "Product Added Successfully");
            Navigator.pop(context);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
