import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String productName;
  final List<dynamic> images;
  final String description;
  final String price;
  final String category;
  Product({
    required this.productName,
    required this.images,
    required this.description,
    required this.price,
    required this.category,
  });

  Map<String, dynamic> toJson() {
    return {
      'product': productName,
      'images': images,
      'description': description,
      'category': category,
      'price': price
    };
  }

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
      productName: json['product'],
      images: json['images'],
      description: json['description'],
      price: json['price'],
      category: json['category'],
    );
  }

  static Stream<List<Product>> getProducts() {
    return FirebaseFirestore.instance
        .collection('myApp')
        .doc('Admin')
        .collection('Products')
        .snapshots()
        .map(
          (snapshots) => snapshots.docs
              .map((docs) => Product.fromJson(docs.data()))
              .toList(),
        );
  }

  static Future<void> addProduct({
    required String productName,
    required List<String> images,
    required String description,
    required String price,
    required String category,
  }) async {
    final docProduct = FirebaseFirestore.instance
        .collection('myApp')
        .doc('Admin')
        .collection('Products')
        .doc(productName);

    final product = Product(
        productName: productName,
        images: images,
        description: description,
        price: price,
        category: category);

    final json = product.toJson();
    await docProduct.set(json);
  }

  static Future<void> deleteProduct({required String productName}) async {
    FirebaseFirestore.instance
        .collection('myApp')
        .doc('Admin')
        .collection('Products')
        .doc(productName)
        .delete();
  }
}
