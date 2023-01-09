import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todolist/Infrastructure/enums/routes_enum.dart';
import 'package:todolist/Presenter/view/auth/login_screen.dart';
import 'package:todolist/Presenter/view/home_screen/home_screen.dart';
import 'package:todolist/Presenter/view/splash/splash_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:todolist/app/users/check_login/check_user_login_app.dart';

class MainScreen extends StatelessWidget {
  final CheckUserLoginApp userClass;
  MainScreen(this.userClass);

  Future<Widget> checkLogin() async{
    if(this.userClass.checkLogin()){
      return LoginScreen();
    }else{
      return HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Todo List',
        routes: Routes.routes,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[50],
          primaryColor: const Color(0xFFF79E89),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange).copyWith(secondary: const Color(0xFFF76C6A)),
        ),
        home: AnimatedSplashScreen.withScreenFunction(
          splash: SplashScreen(),
          screenFunction: this.checkLogin,
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.leftToRightWithFade,
          splashIconSize: 500,
        )
    );
  }



}
