import 'package:todolist/Presenter/view/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:todolist/app/users/check_login/check_user_login_app.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MainScreen(new CheckUserLoginApp());
  }
}