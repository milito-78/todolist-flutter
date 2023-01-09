import 'package:flutter/material.dart';

class LineWidget extends StatelessWidget{
  late final double height;
  late final double width;
  LineWidget({this.width = 80,this.height = 6});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
    );
  }

}