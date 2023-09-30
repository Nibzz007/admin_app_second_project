import 'package:admin_app_second_project/model/orders_model.dart';
import 'package:admin_app_second_project/orders/active%20order%20screen/widgets/order_details_widget.dart';
import 'package:admin_app_second_project/orders/active%20order%20screen/widgets/order_image_card.dart';
import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({
    super.key,
    required this.order,
  });

  final Orders order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Order details',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderImageCard(
              image: order.image,
            ),
            OrderDetailsWidget(order: order),
          ],
        ),
      ),
    );
  }
}
