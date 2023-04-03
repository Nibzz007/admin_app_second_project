import 'package:flutter/material.dart';

class AddProductHeading extends StatelessWidget {
  const AddProductHeading({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }
}