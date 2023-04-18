import 'package:admin_app_second_project/model/orders_model.dart';
import 'package:admin_app_second_project/utils/size.dart';
import 'package:flutter/material.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({super.key, required this.order});

  final Orders order;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order no : ${order.orderId}'),
            kHeight10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(order.productName),
                Text('${order.price}'),
              ],
            ),
            kHeight10,
            Text('Quantity : ${order.cartCount}'),
            kHeight10,
            const Text('User details'),
            kHeight5,
            Text(order.email),
            kHeight10,
            const Text('Shipping address'),
            kHeight5,
            Text(order.address),
          ],
        ),
      ),
    );
  }
}
