import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  final String productName;
  final String price;
  const ProductGrid({
    Key? key,
    required this.productName,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 203,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFF2F2F2)),
              ),
              Positioned(
                top: 15,
                left: 120,
                child: Icon(
                  Icons.favorite_border_rounded,
                  color: Color(0xFF8F959E),
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(productName),
              Text("\$${price}"),
            ],
          )
        ],
      ),
    );
  }
}
