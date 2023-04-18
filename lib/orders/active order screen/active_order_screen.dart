import 'package:admin_app_second_project/model/orders_model.dart';
import 'package:admin_app_second_project/utils/size.dart';
import 'package:flutter/material.dart';
import '../widgets/order_card.dart';

class ActiveOrderScreen extends StatelessWidget {
  const ActiveOrderScreen({super.key});

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
            List<Orders> activeOrderList = [];
            final orderList = snapshot.data;
            for (var order in orderList!) {
              if (order.isCompleted == false && order.isCancelled == false) {
                activeOrderList.add(order);
              }
            }
            return activeOrderList.isEmpty
                ? const Center(
                    child: Text('No active orders'),
                  )
                : ListView.separated(
                    itemBuilder: ((context, index) {
                      final order = activeOrderList[index];
                      return OrderCard(order: order);
                    }),
                    separatorBuilder: ((context, index) => kHeight10),
                    itemCount: activeOrderList.length,
                  );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }
}
