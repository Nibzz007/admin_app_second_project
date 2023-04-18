import 'package:admin_app_second_project/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryDropDownWidget extends StatefulWidget {
  const CategoryDropDownWidget({super.key, this.onChanged});

  final Function(String)? onChanged;

  @override
  State<CategoryDropDownWidget> createState() => _CategoryDropDownWidgetState();
}

class _CategoryDropDownWidgetState extends State<CategoryDropDownWidget> {
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: FutureBuilder(
        future: Category.getCategories().first,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Some error occured '),
            );
          } else if (snapshot.hasData) {
            final categories = snapshot.data!;
            return DropdownButton<String>(
              value: selectedItem,
              underline: const SizedBox(),
              borderRadius: BorderRadius.circular(15),
              isExpanded: true,
              hint: const Text('Select item'),
              items: categories.map((value) {
                return DropdownMenuItem<String>(
                  value: value.category,
                  child: Text(value.category),
                );
              }).toList(),
              onChanged: ((String? value) {
                setState(() {
                  selectedItem = value;
                  widget.onChanged!(value!);
                });
              }),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
