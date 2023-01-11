import 'package:flutter/material.dart';
import 'package:todolist/presenter/view/forget_password/code_screen.dart';
import 'package:todolist/presenter/view/forget_password/forget_password_screen.dart';
import 'package:todolist/presenter/view/forget_password/reset_password_screen.dart';
import 'package:todolist/presenter/view/home_screen/home_screen.dart';
import 'package:todolist/presenter/view/profile/change_password_screen.dart';
import 'package:todolist/presenter/view/profile/profile_screen.dart';
import 'package:todolist/presenter/view/auth/register_screen.dart';
import 'package:todolist/presenter/view/splash/splash_screen.dart';
import 'package:todolist/presenter/view/auth/login_screen.dart';
import 'package:todolist/presenter/view/todo/todo_details_screen.dart';

class RouteName {
  static const String register          = "/register";
  static const String login             = "/login";
  static const String forget_password   = "/forget-password";
  static const String check_code        = "/check-code";
  static const String reset_password    = "/reset-password";
  static const String splash            = '/splash';
  static const String change_password   = '/profile/change-password' ;
  static const String profile           = '/profile';
  static const String home              = '/home_screen'  ;
  static const String todo_details      = '/todo/details' ;
}

class Routes {
  static const MAIN_URL = "milito.ir/";

  static Map<String,WidgetBuilder> routes = {
    RouteName.splash            : (context) => SplashScreen(),
    RouteName.change_password   : (context) => ChangePasswordScreen(),
    RouteName.profile           : (context) => ProfileScreen(),
    RouteName.home              : (context) => HomeScreen(),
    RouteName.login             : (context) => LoginScreen(),
    RouteName.register          : (context) => RegisterScreen(),
    RouteName.todo_details      : (context) => TodoDetailsScreen(),
    RouteName.check_code        : (context) => CodeScreen(),
    RouteName.reset_password    : (context) => ResetPasswordScreen(),
    RouteName.forget_password   : (context) => ForgetPasswordScreen()
  };
}