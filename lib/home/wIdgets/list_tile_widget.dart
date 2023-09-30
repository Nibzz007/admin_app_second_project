import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final Text title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey.shade400,
      title: title,
      onTap: onTap,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 0.5),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
