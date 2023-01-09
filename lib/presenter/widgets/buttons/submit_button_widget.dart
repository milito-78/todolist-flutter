import 'package:flutter/material.dart';
import 'package:todolist/Infrastructure/enums/sizes_enum.dart';

class SubmitButton extends StatelessWidget{
  late final Function submitAction;
  final String name;
  SubmitButton(this.name,this.submitAction);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Button.width,
        height: Button.height,
        child: ElevatedButton(
          child: Text(
            this.name,
            style: TextStyle(fontSize: 17),
          ),
          onPressed: () => submitAction(context) ,
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        )
    );
  }

}