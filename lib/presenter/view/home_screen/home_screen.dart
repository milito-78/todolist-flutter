import 'package:flutter/material.dart';
import 'package:todolist/infrastructure/enums/sizes_enum.dart';
import 'package:todolist/presenter/widgets/custom_appbar_widget.dart';
import 'package:todolist/presenter/widgets/new_work_modal_widget.dart';
import 'package:todolist/presenter/widgets/todo_lists/todolists_widget.dart';
import 'package:todolist/presenter/widgets/todolist_filter_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              Paddings.left,
              Paddings.top,
              Paddings.right,
              0,
            ),
            child: Column(
              children: [
                CustomAppbarWidget(),
                SizedBox(
                  height: 40,
                ),
                TodoListFilterWidget(),
                SizedBox(
                  height: 13,
                ),
                TodoListsWidget(),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 40,
          ),
          onPressed: () => openAddModal(context),
        ),
      ),
    );
  }

  void openAddModal(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(22, 22),
            topRight: Radius.elliptical(22, 22)),
      ),
      backgroundColor: const Color(0xFFF79E89),
      barrierColor: Colors.white.withOpacity(0),
      isScrollControlled: true,
      context: context,
      builder: (_) {
        return FractionallySizedBox(
          heightFactor: 0.89,
          child: NewWorkModalWidget(),
        );
      },
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit TodoList'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }
}
