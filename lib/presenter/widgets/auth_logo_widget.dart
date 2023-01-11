import 'package:flutter/material.dart';
import 'package:todolist/presenter/widgets/logo_widget.dart';

class AuthLogoWidget extends StatelessWidget {
  final double logoWidth;

  final double logoHeight;
  final double height;

  const AuthLogoWidget(
      {this.height = 360, this.logoWidth = 187, this.logoHeight = 180});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      alignment: Alignment.bottomCenter,
      child: LogoWidget(
        width: this.logoWidth,
        height: this.logoHeight,
      ),
    );
  }
}
