import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todolist/Infrastructure/enums/routes_enum.dart';
import 'package:todolist/Infrastructure/enums/sizes_enum.dart';
import 'package:todolist/Presenter/widgets/buttons/submit_button_widget.dart';
import 'package:todolist/Presenter/widgets/inputs/input_widget.dart';
import 'package:todolist/Presenter/widgets/inputs/password_widget.dart';
import 'package:todolist/Presenter/widgets/loading_widget.dart';
import 'package:todolist/Presenter/widgets/logo_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding:
                EdgeInsets.fromLTRB(Paddings.left, 180, Paddings.right, 10),
            child: Column(
              children: <Widget>[
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
                        'Enter your Email we will send you 5 digits code',
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80.0,
                ),
                InputText("email", "Email"),
                SizedBox(
                  height: 50.0,
                ), // height + height
                SubmitButton("SEND CODE", _sendCode),
              ],
            ),
          )
        ],
      ),
    );
  }

  _sendCode(BuildContext context) async {
    //send email code
    Dialogs.showLoadingDialog(context, _keyLoader);

    await Future.delayed(Duration(milliseconds: 2000));

    Navigator.pop(context);
    Navigator.popAndPushNamed(context, RouteName.check_code);
  }

}
