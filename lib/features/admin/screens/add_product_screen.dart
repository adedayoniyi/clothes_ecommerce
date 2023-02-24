import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:clothes_ecommerce/constants/utils.dart';
import 'package:clothes_ecommerce/features/auth/admin_services.dart';
import 'package:clothes_ecommerce/widgets/add_product_textfield.dart';
import 'package:clothes_ecommerce/widgets/custom_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = '/add-product';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final sellProductKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  final AdminServices adminServices = AdminServices();

  void sellProduct() {
    if (sellProductKey.currentState!.validate()) {
      adminServices.sellProduct(
        context: context,
        name: nameController.text,
        description: descriptionController.text,
        price: double.parse(priceController.text),
        category: category,
        quantity: double.parse(quantityController.text),
        images: images,
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  String category = "Adidas";
  List<File> images = [];

  List<String> productCategories = [
    "Adidas",
    "Nike",
    "Fila",
    "Puma",
  ];

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9775FA),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: sellProductKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                images.isNotEmpty
                    ? CarouselSlider(
                        items: images.map((i) {
                          return Builder(
                              builder: (BuildContext context) => Image.file(
                                    i,
                                    fit: BoxFit.cover,
                                    height: 200,
                                  ));
                        }).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                        ),
                      )
                    : GestureDetector(
                        onTap: selectImages,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 4],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            height: 180,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.folder_open),
                                Text("Select Product Images"),
                              ],
                            ),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 10,
                ),
                AddProductTextField(
                  controller: nameController,
                  hintText: 'Product Name',
                ),
                const SizedBox(
                  height: 10,
                ),
                AddProductTextField(
                  controller: descriptionController,
                  hintText: 'Product Description',
                  maxLines: 7,
                ),
                const SizedBox(
                  height: 10,
                ),
                AddProductTextField(
                  controller: quantityController,
                  hintText: 'Product Quantity',
                ),
                const SizedBox(
                  height: 10,
                ),
                AddProductTextField(
                  controller: priceController,
                  hintText: 'Product Price',
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: category,
                    items: productCategories.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newVal) {
                      setState(() {
                        category = newVal!;
                      });
                    },
                  ),
                ),
                CustomButton(
                  borderRadius: BorderRadius.circular(20),
                  onPressed: sellProduct,
                  text: "Add Product",
                  fixedSize: const Size(double.infinity, 50),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
