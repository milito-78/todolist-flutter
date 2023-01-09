import 'package:flutter/material.dart';
import 'package:todolist/Infrastructure/enums/sizes_enum.dart';

class CreateInputText extends StatelessWidget{
  final String placeholder;
  final String name;

  CreateInputText(this.name,this.placeholder);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Input.width,
      height: Input.height,
      child: TextField(
        textInputAction: TextInputAction.next,
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(width: 0.8),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(width: 2, color: Colors.white)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(width: 2, color: Colors.white),
          ),
          hintStyle: TextStyle(color: Colors.white60, fontSize: 18),
          hintText: this.placeholder,
        ),
      ),
    );
  }

}