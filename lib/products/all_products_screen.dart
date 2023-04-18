import 'package:admin_app_second_project/model/product_model.dart';
import 'package:admin_app_second_project/utils/colors.dart';
import 'package:flutter/material.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'All Products',
        ),
      ),
      body: StreamBuilder<List<Product>>(
        stream: Product.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          } else if (snapshot.hasData) {
            final products = snapshot.data!;
            if (products.isEmpty) {
              return const Center(
                child: Text('Product list is empty'),
              );
            } else {
              return ListView(
                children: products.map(showProducts).toList(),
              );
            }
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Widget showProducts(Product product) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: kGreay400,
        ),
        child: ListTile(
          leading: Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.network(product.images[0]),
          ),
          title: Text(product.productName),
          subtitle: Text(product.price),
          trailing: IconButton(
            onPressed: () async {
              await Product.deleteProduct(
                productName: product.productName,
              );
              const ScaffoldMessenger(
                child: SnackBar(
                  content: Text('Product deleted successfully'),
                ),
              );
            },
            icon: const Icon(
              Icons.delete,
            ),
          ),
        ),
      ),
    );
  }
}
