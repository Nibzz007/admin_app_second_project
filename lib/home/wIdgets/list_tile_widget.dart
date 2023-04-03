import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    Key? key,
    required this.title,
    required this.onTap,
    required this.shape,
  }) : super(key: key);

  final Text title;
  final Function() onTap;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey.shade400,
      title: title,
      onTap: onTap,
      shape: shape,
    );
  }
}
