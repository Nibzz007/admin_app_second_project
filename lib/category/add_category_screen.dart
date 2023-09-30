import 'dart:developer';
import 'dart:io';
import 'package:admin_app_second_project/model/category_model.dart';
import 'package:admin_app_second_project/utils/show_snack_bar_function.dart';
import 'package:admin_app_second_project/utils/size.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddCategory extends StatelessWidget {
  AddCategory({super.key});

  final TextEditingController categoryController = TextEditingController();
  XFile? imageFile;
  UploadTask? uploadTask;
  final GlobalKey formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Add Categories',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            kHeight20,
            StatefulBuilder(
              builder: (context, setState) {
                return Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: imageFile == null
                          ? null
                          : FileImage(
                              File(imageFile!.path),
                            ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 0,
                      child: IconButton(
                        onPressed: () async {
                          final image = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (image == null) {
                            return;
                          }
                          setState(() {
                            imageFile = image;
                          });
                        },
                        icon: const Icon(
                          Icons.add_a_photo,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            kHeight20,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: categoryController,
                validator: (value) {
                  if (value != null && value.length < 4) {
                    return 'Enter a valid category';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  label: const Text('Category name'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            kHeight10,
            ElevatedButton.icon(
              onPressed: () async {
                // if (!formKey.currentState!.validate()) {
                //   return;
                // }
                await addCategory();
                showSnackBar(
                  context,
                  'Category added successfully',
                );
              },
              icon: const Icon(
                Icons.add,
              ),
              label: const Text(
                'Add category',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> uploadImage() async {
    if (imageFile == null) {
      return '';
    }
    final path = 'files/${imageFile!.name}';
    final file = File(imageFile!.path);
    final ref = FirebaseStorage.instance.ref().child(path);
    uploadTask = ref.putFile(file);
    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    return urlDownload;
  }

  Future<void> addCategory() async {
    if (imageFile == null) {
      return;
    }

    final downloadImageurl = await uploadImage();
    log('Image Uploaded succeffuly $downloadImageurl');

    await Category.addCategory(
      category: categoryController.text.trim(),
      image: downloadImageurl,
    );
  }
}
