import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todolist/infrastructure/enums/routes_enum.dart';
import 'package:todolist/infrastructure/enums/sizes_enum.dart';
import 'package:todolist/presenter/widgets/buttons/submit_button_widget.dart';
import 'package:todolist/presenter/widgets/loading_widget.dart';
import 'package:todolist/presenter/widgets/logo_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPasswordScreen> {
  bool showPassword = false;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  showPasswordHandle()
  {
    this.showPassword = this.showPassword ? false : true;
  }

  Icon eyeIcon = Icon(
    Icons.remove_red_eye_outlined,
    size: 30.0,
    color: Colors.grey,);

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
              SizedBox(height: 80),
              Container(
                alignment: Alignment.center,
                width: Button.width,
                child: Column(
                  children: [
                    Text(
                      'Forget Password',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'Set your new Password',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 28.0,
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
                      icon: this.showPassword ? this.eyeShowIcon: this.eyeIcon,
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
                      icon: this.showPassword ? this.eyeShowIcon: this.eyeIcon,
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
              SubmitButton("RESET PASSWORD", _submitChangePassword),
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

      Navigator.pushNamedAndRemoveUntil(context, RouteName.login, (Route<dynamic> route) => false);
  }
}
