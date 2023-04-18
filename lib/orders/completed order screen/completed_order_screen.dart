import 'package:admin_app_second_project/model/orders_model.dart';
import 'package:admin_app_second_project/orders/widgets/order_card.dart';
import 'package:admin_app_second_project/utils/size.dart';
import 'package:flutter/material.dart';

class CompletedOrderScreen extends StatelessWidget {
  const CompletedOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Orders.getAllOrders(),
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong'),
          );
        } else if (snapshot.hasData) {
          List<Orders> completedOrderList = [];
          final orderList = snapshot.data;
          for (var order in orderList!) {
            if (order.isCompleted == true) {
              completedOrderList.add(order);
            }
          }
          return completedOrderList.isEmpty
              ? const Center(
                  child: Text('No current orders'),
                )
              : ListView.separated(
                  itemBuilder: ((context, index) {
                    final order = completedOrderList[index];
                    return OrderCard(order: order);
                  }),
                  separatorBuilder: ((context, index) => kHeight10),
                  itemCount: completedOrderList.length,
                );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
