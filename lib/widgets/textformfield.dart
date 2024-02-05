import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  TextFieldWidget(
      {super.key,
      required this.controller,
      required this.label,
      required this.hint});

  @override
  State<TextFieldWidget> createState() => TextFieldWidgetState();
}

class TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
            labelText: widget.label,
            hintText: widget.hint,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color.fromARGB(46, 0, 0, 0)),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            )),
      ),
    );
  }
}
