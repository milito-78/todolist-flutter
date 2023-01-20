import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todolist/presenter/view/auth/login_screen.dart';
import 'package:todolist/presenter/view/home_screen/home_screen.dart';

class MainController extends GetxController{
  Future<Widget> checkLogin() async{
    final appdata = GetStorage(); // instance of GetStorage
    String? token = appdata.read("bearer_token");

    if(token == null){
      return LoginScreen();
    }else{
      return HomeScreen();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}