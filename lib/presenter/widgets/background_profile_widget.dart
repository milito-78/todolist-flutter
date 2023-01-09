import 'package:flutter/material.dart';

class BackgroundProfileWidget extends StatelessWidget {
  final double width ;
  final double height;

  BackgroundProfileWidget({this.width = 200, this.height = 200});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage("assets/images/background/rafiki.png"),
      width: this.width,
      height: this.height,
    );
  }
}
