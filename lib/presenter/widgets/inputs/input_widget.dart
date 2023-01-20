import 'package:flutter/material.dart';
import 'package:todolist/infrastructure/enums/sizes_enum.dart';

class InputText extends StatelessWidget {
  final String placeholder;
  final String name;
  final String? Function(String?)? validation;
  final TextEditingController? controller;

  InputText(this.name, this.placeholder, [this.validation,this.controller]);

  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please $name field must be filled';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Input.width,
      height: Input.height,
      child: TextFormField(
        controller: controller??TextEditingController(),
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(width: 0.8),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(width: 0.8, color: Colors.grey.shade800)),
          hintText: this.placeholder,
        ),
        validator: validation??validator,
      ),
    );
  }
}
