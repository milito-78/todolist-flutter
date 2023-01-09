import 'package:flutter/material.dart';
import 'package:todolist/Infrastructure/enums/routes_enum.dart';
import 'package:todolist/Infrastructure/enums/sizes_enum.dart';
import 'package:todolist/Presenter/widgets/background_profile_widget.dart';
import 'package:todolist/Presenter/widgets/buttons/submit_button_widget.dart';
import 'package:todolist/Presenter/widgets/custom_appbar_widget.dart';
import 'package:todolist/Presenter/widgets/loading_widget.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                Paddings.left, Paddings.top, Paddings.right, Paddings.bottom
            ),
            child: Column(
              children: [
                CustomAppbarWidget(
                  disableProfileClick: true,
                ),
                SizedBox(
                  height: 120,
                ),
                BackgroundProfileWidget(
                  width: 370,
                  height: 250,
                ),
                SizedBox(
                  height: 110,
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Full Name",
                              style: TextStyle(color: Colors.grey, fontSize: 18.0),
                            ),
                            Text(
                              "Milad Purahmad",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Email",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18.0
                              ),
                            ),
                            Text(
                              "hbk.mp71@gmail.com",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 18.0
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Password",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18.0,
                              ),
                            ),
                            GestureDetector(
                              onTap: _changePassword,
                              child: Text(
                                "Change Password",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 18.0
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 53,
                ),
                SubmitButton("Log out",submitLogout)
              ],
            ),
          ),
      )
    );
  }

  submitLogout(BuildContext context) async {
      //login action
      Dialogs.showLoadingDialog(context, _keyLoader);

      await Future.delayed(Duration(milliseconds: 2000));

      Navigator.pushNamedAndRemoveUntil(context,RouteName.login, (Route<dynamic> route) => false);
  }

  _changePassword(){
    Navigator.pushNamed(context,RouteName.change_password);
  }
}
