import 'package:flutter/material.dart';
import 'package:todolist/presenter/widgets/logo_widget.dart';


class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: LogoWidget(),
    );
  }
}
