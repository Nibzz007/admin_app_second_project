import 'package:admin_app_second_project/category/all_categories_screen.dart';
import 'package:admin_app_second_project/Products/all_products_screen.dart';
import 'package:admin_app_second_project/category/add_category_screen.dart';
import 'package:admin_app_second_project/Orders/Order screen/orders_screen.dart';
import 'package:admin_app_second_project/Products/add_products_screen.dart';
import 'package:admin_app_second_project/Settings/settings_screen.dart';
import 'package:admin_app_second_project/Utils/size.dart';
import 'package:flutter/material.dart';
import 'wIdgets/list_tile_widget.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Admin Panel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            ListTileWidget(
              title: const Text(
                'All Products',
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AllProductsScreen(),
                  ),
                );
              },
              shape: Border.all(
                width: 0.2,
              ),
            ),
            kHeight10,
            ListTileWidget(
              title: const Text(
                'All Categories',
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AllCategoriesScreen(),
                  ),
                );
              },
              shape: Border.all(
                width: 0.2,
              ),
            ),
            kHeight10,
            ListTileWidget(
              title: const Text(
                'Add Categories',
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddCategory(),
                  ),
                );
              },
              shape: Border.all(
                width: 0.2,
              ),
            ),
            kHeight10,
            ListTileWidget(
              title: const Text(
                'Add Products',
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddProductsScreen(),
                  ),
                );
              },
              shape: Border.all(
                width: 0.2,
              ),
            ),
            kHeight10,
            ListTileWidget(
              title: const Text(
                'Orders',
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const OrdersScreen(),
                  ),
                );
              },
              shape: Border.all(
                width: 0.2,
              ),
            ),
            kHeight10,
            ListTileWidget(
              title: const Text(
                'Settings',
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
              shape: Border.all(
                width: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
