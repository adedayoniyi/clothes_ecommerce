import 'dart:convert';

class Product {
  final String name;
  final String description;
  final List<String> images;
  final String category;
  final double price;
  final double quantity;
  Product({
    required this.name,
    required this.description,
    required this.images,
    required this.category,
    required this.price,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'images': images,
      'category': category,
      'price': price,
      'quantity': quantity,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      images: List<String>.from(map['images']),
      category: map['category'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      quantity: map['quantity']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
