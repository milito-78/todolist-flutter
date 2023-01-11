import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todolist/infrastructure/enums/routes_enum.dart';
import 'package:todolist/infrastructure/enums/sizes_enum.dart';
import 'package:todolist/presenter/widgets/buttons/submit_button_widget.dart';
import 'package:todolist/presenter/widgets/inputs/input_widget.dart';
import 'package:todolist/presenter/widgets/inputs/password_widget.dart';
import 'package:todolist/presenter/widgets/loading_widget.dart';
import 'package:todolist/presenter/widgets/auth_logo_widget.dart';
import 'package:todolist/presenter/widgets/buttons/auth_text_button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: Paddings.left, right: Paddings.right),
            child: Column(
              children: <Widget>[
                AuthLogoWidget(),
                SizedBox(height: 170),
                InputText("email", "Email"),
                SizedBox(
                  height: SpaceBetween.verticalInput,
                ),
                PasswordInput("password", "Password"),
                Container(
                  width: Input.width,
                  height: 46,
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.grey,
                      textStyle: TextStyle(
                        fontSize: 12.0,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: forgetPassword,
                    child: Text("Forget password?"),
                  ),
                ), //Forget Password
                SubmitButton("SIGN IN", submitLogin),
                AuthTextButtonWidget(
                  "Don't have an account? ",
                  "Sign up",
                  toSignUp,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  submitLogin(BuildContext context) async {
    //login action
    Dialogs.showLoadingDialog(context, _keyLoader);

    await Future.delayed(Duration(milliseconds: 2000));

    Navigator.pop(context);
    Navigator.popAndPushNamed(context, RouteName.home);
  }

  forgetPassword() {
    Fluttertoast.showToast(
        msg: "Email send for reset password",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Theme.of(context).primaryColor,
        textColor: Colors.white,
        fontSize: 16.0 //message font size
        );
    Navigator.pushNamed(context, RouteName.forget_password);
  }

  toSignUp(BuildContext context) {
    Navigator.pushNamed(context, RouteName.register);
  }
}
