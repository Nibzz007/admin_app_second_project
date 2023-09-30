import 'package:admin_app_second_project/model/orders_model.dart';
import 'package:admin_app_second_project/utils/show_snack_bar_function.dart';
import 'package:admin_app_second_project/utils/size.dart';
import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';

class OrderTrackScreen extends StatelessWidget {
  OrderTrackScreen({super.key, required this.order});

  final Orders order;

  List<StepperData> stepperList = [
    StepperData(
      title: StepperText('Order Placed'),
      subtitle: StepperText('Your order has been placed'),
    ),
    StepperData(
      title: StepperText('Shipped'),
      subtitle: StepperText('Your order has been shipped'),
    ),
    StepperData(
      title: StepperText('Out for delivery'),
      subtitle: StepperText('Your order is out for delivery'),
    ),
    StepperData(
      title: StepperText('Delivered'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Order'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
             await Orders.cancelOrder(order: order);
              showSnackBar(context, 'Order is cancelled');
              Navigator.pop(context);
            },
            icon: const Icon(Icons.cancel_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 0.3)
                ),
                child: Row(
                  children: [
                    Container(
                      height: screenHeight * 0.135,
                      width: screenHeight * 0.135,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            order.image,
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 0.2)
                      ),
                    ),
                    kWidth10,
                    Expanded(
                      child: SizedBox(
                        height: screenHeight * 0.135,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.productName,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(order.orderId),
                            Text('Quantity = ${order.cartCount}'),
                            Text(
                              order.price.toString(),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              kWidth20,
              AnotherStepper(
                stepperList: stepperList,
                stepperDirection: Axis.vertical,
                verticalGap: 50,
                activeIndex: order.deliveryType,
                activeBarColor: Colors.blue,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int deliveryProcess = order.deliveryType;
          Orders.updateOrder(
            order: order,
            newProcess: deliveryProcess + 1,
          );
          Navigator.pop(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
