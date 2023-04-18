import 'dart:io';
import 'package:admin_app_second_project/model/product_model.dart';
import 'package:admin_app_second_project/products/widgets/dropdown_widget.dart';
import 'package:admin_app_second_project/utils/colors.dart';
import 'package:admin_app_second_project/utils/size.dart';
import 'package:admin_app_second_project/utils/show_snack_bar_function.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'widgets/add_product_heading.dart';
import 'widgets/custom_text_field_widget.dart';

class AddProductsScreen extends StatefulWidget {
  const AddProductsScreen({super.key});

  @override
  State<AddProductsScreen> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {
  ValueNotifier<List<File>> images = ValueNotifier([]);

  final productNameController = TextEditingController();

  final descriptionController = TextEditingController();

  final priceController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  UploadTask? uploadTask;
  String category = 'Others';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Add Products',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            kHeight10,
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: kGreay400,
                      width: double.infinity,
                      height: double.infinity,
                      child: ValueListenableBuilder(
                        valueListenable: images,
                        builder: (context, images, _) {
                          return GridView.builder(
                            itemCount: images.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Image.file(
                                File(images[index].path),
                                fit: BoxFit.cover,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: IconButton(
                      onPressed: () async {
                        await pickMultipleImages();
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 7,
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        kHeight10,
                        const AddProductHeading(
                          text: 'Product Name',
                        ),
                        kHeight10,
                        CustomTextFieldWidget(
                          controller: productNameController,
                          hintText: 'Product name',
                          validator: ((name) {
                            return name != null && name.length < 3
                                ? 'Enter a valid product name'
                                : null;
                          }),
                        ),
                        kHeight10,
                        const AddProductHeading(text: 'Price'),
                        kHeight10,
                        CustomTextFieldWidget(
                          controller: priceController,
                          hintText: 'Price',
                          validator: (price) {
                            return price != null && price.length < 2
                                ? 'Enter a valid price'
                                : null;
                          },
                        ),
                        kHeight10,
                        const AddProductHeading(text: 'Description'),
                        kHeight10,
                        CustomTextFieldWidget(
                          controller: descriptionController,
                          hintText: 'Description',
                          maxLines: 6,
                          validator: (description) {
                            return description != null &&
                                    description.length < 10
                                ? 'Enter valid descrioption'
                                : null;
                          },
                        ),
                        kHeight10,
                        const AddProductHeading(
                          text: 'Category',
                        ),
                        kHeight10,
                        CategoryDropDownWidget(
                          onChanged: onDropdownChanged,
                        ),
                        kHeight20,
                        ElevatedButton.icon(
                          onPressed: () async {
                            if (!formKey.currentState!.validate()) {
                              return;
                            }
                            await addProduct();
                            showSnackBar(
                              context,
                              'Product added succesfully',
                            );
                          },
                          icon: const Icon(Icons.add),
                          label: const Text(
                            'Add product',
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void onDropdownChanged(String data) {
    category = data;
  }

  Future<void> pickMultipleImages() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );
    if (result == null) {
      return;
    }
    images.value = result.paths.map((path) => File(path!)).toList();
    images.notifyListeners();
  }

  Future<void> addProduct() async {
    if (images.value.isEmpty) {
      return;
    }
    final imageList = await uploadImages();
    await Product.addProduct(
      productName: productNameController.text.trim(),
      images: imageList,
      description: descriptionController.text.trim(),
      price: priceController.text.trim(),
      category: category,
    );
  }

  Future<List<String>> uploadImages() async {
    if (images.value.isEmpty) {
      return [];
    }
    List<String> imageUrl = [];
    for (var image in images.value) {
      final path = 'files/products/${image.path}';
      final file = File(image.path);

      final ref = FirebaseStorage.instance.ref().child(path);
      uploadTask = ref.putFile(file);
      final snapshot = await uploadTask!.whenComplete(() {});
      final uploadUrl = await snapshot.ref.getDownloadURL();
      imageUrl.add(uploadUrl);
    }
    return imageUrl;
  }
}
