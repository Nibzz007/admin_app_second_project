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
            Text(
              'Order no : ${order.orderId}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(
              thickness: 1,
            ),
            kHeight10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Name : ${order.productName}'
                  ,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Price : ${order.price}',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            kHeight10,
            const Divider(
              thickness: 1,
            ),
            kHeight10,
            Text(
              'Quantity : ${order.cartCount}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            kHeight10,
            const Divider(
              thickness: 1,
            ),
            const Text(
              'User details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            kHeight10,
            Text(order.email),
            kHeight10,
            const Divider(
              thickness: 1,
            ),
            const Text(
              'Shipping address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            kHeight10,
            Text(order.address),
          ],
        ),
      ),
    );
  }
}
