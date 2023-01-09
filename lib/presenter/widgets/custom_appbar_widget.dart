import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todolist/Infrastructure/enums/routes_enum.dart';

class CustomAppbarWidget extends StatelessWidget {
  final bool disableProfileClick;

  CustomAppbarWidget({this.disableProfileClick =  false});

  _openProfile(BuildContext context)
  {
    if (!disableProfileClick) {
      return Navigator.pushNamed(context, RouteName.profile);
    }
    return null;
  }

  _gotoHome(BuildContext context)
  {
    if (disableProfileClick){
      return Navigator.popAndPushNamed(context, RouteName.home);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 83,
          child: GestureDetector(
            onTap: () => _gotoHome(context),
            child: SvgPicture.asset(
              "assets/images/svg/TO DO LIST.svg",
              height: 18,
              // width: 83,
            ),
          ),
        ),
        IconButton(
          onPressed: () => _openProfile(context),

          icon: SvgPicture.asset(
            "assets/images/svg/settings.svg",
            width: 50,
          ),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          iconSize: 24,
        )
      ],
    );
  }
}
