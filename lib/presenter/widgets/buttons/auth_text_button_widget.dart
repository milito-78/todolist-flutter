import 'package:flutter/material.dart';
import 'package:todolist/infrastructure/enums/sizes_enum.dart';

class AuthTextButtonWidget extends StatelessWidget{
  late final Function action;
  final String text;
  final String actionName;
  AuthTextButtonWidget(this.text,this.actionName,this.action);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: Input.width,
      height: Input.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            this.text,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
            ),
          ),
          GestureDetector(
              onTap: () => action(context) ,
              child: Text(
                  this.actionName,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Theme.of(context).primaryColor,
                  )
              )
          ),
        ],
      ),
    );
  }

}