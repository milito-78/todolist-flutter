import 'package:get/get.dart';
import 'package:todolist/bootstrap/route/routes_enum.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todolist/controller/main/main_controller.dart';
import 'package:todolist/presenter/view/splash/splash_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class MyApp extends StatelessWidget {
  final appdata = GetStorage(); // instance of GetStorage
  final MainController _mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
        title: 'Todo List',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[50],
          primaryColor: const Color(0xFFF79E89),
          colorScheme:
              ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange).copyWith(
            secondary: const Color(
              0xFFF76C6A,
            ),
          ),
        ),
        getPages: _getRoutes(),
        home: AnimatedSplashScreen.withScreenFunction(
          splash: SplashScreen(),
          screenFunction: _mainController.checkLogin,
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.leftToRightWithFade,
          splashIconSize: 500,
        )
    );
  }

  List<GetPage> _getRoutes() {
    List<GetPage> routes = [];
    Routes.routes.forEach((key, value) {
      routes.add(GetPage(name: key, page: value));
    });
    return routes;
  }
}
