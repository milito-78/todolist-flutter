import 'package:flutter/material.dart';
import 'package:todolist/Infrastructure/enums/sizes_enum.dart';

class InputText extends StatelessWidget{
  final String placeholder;
  final String name;

  InputText(this.name,this.placeholder);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Input.width,
      height: Input.height,
      child: TextField(
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(width: 0.8),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide:
              BorderSide(width: 0.8, color: Colors.grey.shade800)),
          hintText: this.placeholder,
        ),
      ),
    );
  }

}