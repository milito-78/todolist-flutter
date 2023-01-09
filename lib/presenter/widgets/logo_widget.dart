import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double width ;
  final double height;

  LogoWidget({this.width = 187, this.height = 180});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage("assets/images/logo/Union_LOGO.png"),
      width: this.width,
      height: this.height,
    );
  }
}
