import 'package:flutter/material.dart';
import 'package:todolist/presenter/widgets/todo_lists/todolist_widget.dart';

class TodoListsWidget extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    return  Container(
      height: _sizeOfListView(context),
      child: ListView(
        children: [
          TodoListWidget(),
          TodoListWidget(),
          TodoListWidget(),
          TodoListWidget(),
          TodoListWidget(),
          TodoListWidget(),
          TodoListWidget(),
        ],
      ),
    );
  }

  double _sizeOfListView(BuildContext context){
    var height =  MediaQuery.of(context).size.height;
    return height - (height * 0.189);
  }

}