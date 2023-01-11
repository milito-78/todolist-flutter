import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todolist/infrastructure/enums/routes_enum.dart';
import 'package:todolist/infrastructure/enums/sizes_enum.dart';
import 'package:todolist/presenter/widgets/buttons/submit_button_widget.dart';
import 'package:todolist/presenter/widgets/inputs/password_widget.dart';
import 'package:todolist/presenter/widgets/loading_widget.dart';
import 'package:todolist/presenter/widgets/logo_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePasswordScreen> {
  bool showPassword = false;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  showPasswordHandle()
  {
    this.showPassword = this.showPassword ? false : true;
  }

  Icon      eye_icon       = Icon(
    Icons.remove_red_eye_outlined,
    size: 30.0,
    color: Colors.grey,);

  SvgPicture eye_show_icon  = SvgPicture.asset(
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
          IconButton(
            padding: EdgeInsets.only(left: 16,top: 10),
              alignment: Alignment.centerLeft,
              constraints: BoxConstraints(),
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios)
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                  Paddings.left, 170 , Paddings.right, 10
              ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: LogoWidget(),
              ),
              SizedBox(height: 170 - 43 - 10),
              PasswordInput("current_password", "Current Password"),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: Input.width,
                height: Input.height,
                child: TextField(
                  obscureText: !this.showPassword,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(width: 0.8),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                            width: 0.8,
                            color: Colors.grey.shade800
                        )
                    ),
                    hintText: "Password",
                    suffixIcon: IconButton(
                      icon: this.showPassword ? this.eye_show_icon: this.eye_icon,
                      onPressed: (){
                        setState(() {
                          this.showPasswordHandle();
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: Input.width,
                height: Input.height,
                child: TextField(
                  obscureText: !this.showPassword,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(width: 0.8),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                            width: 0.8,
                            color: Colors.grey.shade800
                        )
                    ),
                    hintText: "Confirmation Password",
                    suffixIcon: IconButton(
                      icon: this.showPassword ? this.eye_show_icon: this.eye_icon,
                      onPressed: (){
                        setState(() {
                          this.showPasswordHandle();
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              SubmitButton("Change Password", _submitChangePassword),
            ],
          ),)
        ],
      ),
    );
  }

  _submitChangePassword(BuildContext buildContext) async {
      //login action
      Dialogs.showLoadingDialog(context, _keyLoader);

      await Future.delayed(Duration(milliseconds: 2000));

      Navigator.pushNamedAndRemoveUntil(context, RouteName.home, (Route<dynamic> route) => false);
      Navigator.pushNamed(context, RouteName.profile);
  }
}
