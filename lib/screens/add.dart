import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phone_app/widgets/textformfield.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Details'),
      ),
      body: SafeArea(
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
                    color: Color.fromARGB(118, 158, 158, 158),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text('Upload Image')),
                ),
              ),
            ),
            image != null
                ? Image.file(
                    File(image!.path),
                    height: 70,
                    width: 500,
                  )
                : SizedBox(),
            TextFieldWidget(
                controller: titleController, label: 'Title', hint: 'Add Title'),
            TextFieldWidget(
                controller: descriptionController,
                label: 'Description',
                hint: 'Add Description'),
            ElevatedButton(
              onPressed: () {},
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}