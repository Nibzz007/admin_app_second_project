import 'package:admin_app_second_project/model/category_model.dart';
import 'package:flutter/material.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'All Categories',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<List<Category>>(
          stream: Category.getCategories(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Something went wrong ${snapshot.toString()}',
                ),
              );
            } else if (snapshot.hasData) {
              final categories = snapshot.data;
              if (categories!.isEmpty) {
                return const Center(
                  child: Text('Empty'),
                );
              } else {
                return ListView(
                  children: categories.map(showCategories).toList(),
                );
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Widget showCategories(Category category) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade400,
      ),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.network(category.image),
        ),
        title: Text(category.category),
      ),
    );
  }
}
