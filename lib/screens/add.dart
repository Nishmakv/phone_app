import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phone_app/product_add/bloc/product_add_bloc.dart';
import 'package:phone_app/widgets/textformfield.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  XFile? image;
  ImagePicker? imagePicker;
  Future pickImage(String a) async {
    image = await ImagePicker().pickImage(
        source: a == "Gallery" ? ImageSource.gallery : ImageSource.camera);
    setState(() {});
    if (image != null) {
      Navigator.pop(context);
    }
  }

  void modelBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext ctx) {
        return Container(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  pickImage('Camera');
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text('Gallery'),
                onTap: () {
                  pickImage('Gallery');
                },
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductAddBloc, ProductAddState>(
      listener: (context, state) {
        if (state is Success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Successfull'),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Details'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: GestureDetector(
                    onTap: () {
                      modelBottomSheet(context);
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(118, 158, 158, 158),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(child: Text('Upload Image')),
                    ),
                  ),
                ),
                image != null
                    ? Image.file(
                        File(image!.path),
                        height: 70,
                        width: 500,
                      )
                    : const SizedBox(),
                TextFieldWidget(
                    controller: titleController,
                    label: 'Title',
                    hint: 'Add Title'),
                TextFieldWidget(
                    controller: descriptionController,
                    label: 'Description',
                    hint: 'Add Description'),
                TextFieldWidget(
                    controller: brandController,
                    label: 'Brand',
                    hint: 'Add brand'),
                TextFieldWidget(
                    controller: priceController,
                    label: 'Price',
                    hint: 'Add price'),
                TextFieldWidget(
                    controller: categoryController,
                    label: 'Category',
                    hint: 'Add category'),
                ElevatedButton(
                  onPressed: () {
                    context.read<ProductAddBloc>().add(
                          ProductAddEvent.addProduct(
                            title: titleController.text,
                            description: descriptionController.text,
                            brand: brandController.text,
                            category: categoryController.text,
                            price: int.parse(priceController.text),
                          ),
                        );
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
