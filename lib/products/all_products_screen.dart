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
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: SizedBox(
              height: 200,
              width: 80,
              child: Image.asset(
                'assets/images/download.jpeg',
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: const Text('Apple iPhone 13'),
            subtitle: const Text('₹ 70,000'),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
        itemCount: 15,
      ),
    );
  }
}
