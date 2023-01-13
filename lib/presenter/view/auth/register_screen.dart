import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todolist/presenter/bootstrap/routes.dart';
import 'package:todolist/infrastructure/enums/sizes_enum.dart';
import 'package:todolist/presenter/widgets/buttons/submit_button_widget.dart';
import 'package:todolist/presenter/widgets/inputs/input_widget.dart';
import 'package:todolist/presenter/widgets/loading_widget.dart';
import 'package:todolist/presenter/widgets/auth_logo_widget.dart';
import 'package:todolist/presenter/widgets/buttons/auth_text_button_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool showPassword = false;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  showPasswordHandle() {
    this.showPassword = this.showPassword ? false : true;
  }

  Icon eyeIcon = Icon(
    Icons.remove_red_eye_outlined,
    size: 30.0,
    color: Colors.grey,
  );

  SvgPicture eyeShowIcon = SvgPicture.asset(
    "assets/images/svg/eye-off.svg",
    semanticsLabel: 'Eye off',
    width: 35,
    height: 25,
    color: Colors.grey,
    fit: BoxFit.cover,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: Paddings.left,
              right: Paddings.right,
            ),
            child: Column(
              children: <Widget>[
                AuthLogoWidget(),
                SizedBox(height: 64),
                InputText("email", "Email"),
                SizedBox(
                  height: SpaceBetween.verticalInput,
                ),
                InputText("full_name", "Full Name"),
                SizedBox(
                  height: SpaceBetween.verticalInput,
                ),
                Container(
                  width: Input.width,
                  height: Input.height,
                  child: TextField(
                    textInputAction: TextInputAction.next,
                    obscureText: !this.showPassword,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(width: 0.8),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                              width: 0.8, color: Colors.grey.shade800)),
                      hintText: "Password",
                      suffixIcon: IconButton(
                        icon: this.showPassword
                            ? this.eyeShowIcon
                            : this.eyeIcon,
                        onPressed: () {
                          setState(() {
                            this.showPasswordHandle();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SpaceBetween.verticalInput,
                ),
                Container(
                  width: Input.width,
                  height: Input.height,
                  child: TextField(
                    obscureText: !this.showPassword,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(width: 0.8),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                              width: 0.8, color: Colors.grey.shade800)),
                      hintText: "Password Confirmation",
                      suffixIcon: IconButton(
                        icon: this.showPassword
                            ? this.eyeShowIcon
                            : this.eyeIcon,
                        onPressed: () {
                          setState(() {
                            this.showPasswordHandle();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                SubmitButton("SIGN UP", submitRegister),
                AuthTextButtonWidget(
                  "Have an account? ",
                  "Log in",
                  toLogin,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  submitRegister(BuildContext context) async {
    Dialogs.showLoadingDialog(context, _keyLoader);

    await Future.delayed(Duration(milliseconds: 2000));

    Navigator.pop(context);
    Navigator.popAndPushNamed(context, RouteName.home);
  }

  toLogin(BuildContext context) {
    Navigator.pop(context);
    Navigator.popAndPushNamed(context, RouteName.login);
  }
}
