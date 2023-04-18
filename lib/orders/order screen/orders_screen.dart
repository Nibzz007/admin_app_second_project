import 'package:admin_app_second_project/orders/active%20order%20screen/active_order_screen.dart';
import 'package:admin_app_second_project/orders/completed%20order%20screen/completed_order_screen.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Order screen'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Active',
              ),
              Tab(
                text: 'Completed',
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ActiveOrderScreen(),
            CompletedOrderScreen(),
          ],
        ),
      ),
    );
  }
}
