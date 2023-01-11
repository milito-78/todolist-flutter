import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todolist/infrastructure/enums/sizes_enum.dart';

class PasswordInput extends StatefulWidget{
  final String placeholder;
  final String name;
  PasswordInput(this.name,this.placeholder);

  @override
  State<PasswordInput> createState() => _PasswordInputState(this.name,this.placeholder);
}

class _PasswordInputState extends State<PasswordInput> {
  bool showPassword = false;
  late final String placeholder;
  late final String name;
  _PasswordInputState(this.name,this.placeholder);

  showPasswordHandle() => this.showPassword = !this.showPassword ? true : false;

  Icon eyeIcon = Icon(
    Icons.remove_red_eye_outlined,
    size: 30.0,
    color: Colors.grey,
  );

  SvgPicture eyeShowIcon = SvgPicture.asset(
    "assets/images/svg/eye-off.svg",
    semanticsLabel: 'Eye off',
    width: 35,
    height: 25,
    color: Colors.grey,
    fit: BoxFit.cover,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Input.width,
      height: Input.height,
      child: TextField(
        obscureText: !this.showPassword,
        enableSuggestions: false,
        autocorrect: false,
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
              borderSide: BorderSide(
                  width: 0.8, color: Colors.grey.shade800)),
          hintText: this.placeholder,
          suffixIcon: IconButton(
            icon: this.showPassword ? this.eyeShowIcon : this.eyeIcon,
            onPressed: () {
              setState(() {
                this.showPasswordHandle();
              });
            },
          ),
        ),
      ),
    );
  }
}