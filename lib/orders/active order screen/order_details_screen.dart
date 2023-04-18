import 'package:admin_app_second_project/model/orders_model.dart';
import 'package:admin_app_second_project/orders/active%20order%20screen/widgets/order_details_widget.dart';
import 'package:admin_app_second_project/orders/active%20order%20screen/widgets/order_image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key, required this.order});

  final Orders order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order details'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderImageCard(image: order.image,),
          OrderDetailsWidget(order: order),
        ],
      ),
    );
  }
}