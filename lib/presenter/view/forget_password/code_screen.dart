import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:todolist/infrastructure/enums/routes_enum.dart';
import 'package:todolist/infrastructure/enums/sizes_enum.dart';
import 'package:todolist/presenter/widgets/buttons/submit_button_widget.dart';
import 'package:todolist/presenter/widgets/loading_widget.dart';
import 'package:todolist/presenter/widgets/logo_widget.dart';

class CodeScreen extends StatefulWidget {
  const CodeScreen({Key? key}) : super(key: key);

  @override
  _CodeScreenState createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  int endTime     = DateTime.now().millisecondsSinceEpoch + 1000 * 10;
  bool showResend = false;

  @override
  Widget build(BuildContext context) {
    Widget resendWidget = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Didn't receive the code?",
            style: TextStyle(color: Colors.grey),
          ),
          TextButton(
              style: TextButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                textStyle: TextStyle(fontSize: 14.0),
              ),
              onPressed: _resendCode,
              child: Text(
                  "RESEND"
              )
          )
        ],
      );
    Widget timerWidget = Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Get the code again after: ",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                CountdownTimer(
                  textStyle: TextStyle(
                    fontSize: 14.0
                  ),
                  endTime: endTime,
                  widgetBuilder:(context, CurrentRemainingTime? time) {
                    return
                      TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(0),
                            primary: Theme.of(context).primaryColor,
                          ),
                          onPressed: null,
                          child: Text('${_checkZero(time?.min??0)}:${_checkZero(time?.sec??0)}',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 14.0,
                              )
                          )
                      );
                  },
                  onEnd: _endTimer,
                )
              ],
            );

    StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();
    TextEditingController textEditingController = TextEditingController();

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
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Code sent to ',
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal
                            ),
                          ),
                          Text(
                            'Hbk.mp71@gmail.com',
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  width: Button.width,
                  height: Button.height,
                  child: PinCodeTextField(
                    length: 5,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal
                    ),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(12.0),
                      fieldHeight: Input.height,
                      fieldWidth: 40,
                      borderWidth: 0.8,
                      selectedColor: Theme.of(context).primaryColor,
                      inactiveColor: Colors.grey.shade800,
                      selectedFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      activeColor: Theme.of(context).primaryColor,
                      activeFillColor: Colors.white,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    enableActiveFill: true,
                    errorAnimationController: errorController,
                    controller: textEditingController,
                    onCompleted: (v) {
                      print("Completed");
                    },
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        var currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                    appContext: context,

                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                this.showResend ? resendWidget : timerWidget,
                SizedBox(height: 10,),
                SubmitButton("CHECK CODE", _checkCode),
              ],
            ),
          )
        ],
      ),
    );
  }

  _checkCode(BuildContext context) async {
    //login action
    Dialogs.showLoadingDialog(context, _keyLoader);

    await Future.delayed(Duration(milliseconds: 2000));

    Navigator.pop(context);
    Navigator.popAndPushNamed(context, RouteName.reset_password);
  }

  _resendCode (){
    if (mounted)
      setState(() {
        endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 10;
        showResend = false;
      });
  }

  _endTimer (){
    if (mounted)
      setState(() {
        showResend = true;
      });
  }

  String _checkZero(int val){
    if(val < 10)
      return "0" + val.toString();
    return val.toString();
  }
}


