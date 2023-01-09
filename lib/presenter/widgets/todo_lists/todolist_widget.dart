import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todolist/Infrastructure/enums/routes_enum.dart';

class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final randomNumberGenerator = Random();
    var isLate = randomNumberGenerator.nextBool();
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, RouteName.todo_details),
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: _colorSelector(context,isLate),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 8,
            top: 15,
            bottom: 8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: _titleSelector(context,isLate),
              ),
              SizedBox(
                height: 6,
              ),
              Expanded(
                child: Container(
                  width: 295,
                  child: Text(
                    "Descriptiodsdsdsdsdsdsdadfsdcgfsdvtgvbertgvfn",
                    style: TextStyle(
                      letterSpacing: 1,
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Container(
                child: Text(
                  "created at",
                  style: TextStyle(
                    letterSpacing: 0.5,
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Color _colorSelector(BuildContext context,bool isLate) => isLate ? Theme.of(context).colorScheme.secondary: Theme.of(context).primaryColor;

  Widget _titleSelector(BuildContext context,bool isLate) {
    return isLate ? Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Title",
          style: TextStyle(
            letterSpacing: 1,
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          child: SvgPicture.asset(
            "assets/images/svg/clock.svg",
            color: Colors.white,
          ),
          height: 18,
          width: 18,
        )
      ],
    ) : Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Title",
          style: TextStyle(
            letterSpacing: 1,
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
