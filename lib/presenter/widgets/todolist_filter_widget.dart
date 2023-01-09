import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TodoListFilterWidget extends StatefulWidget {
  @override
  State<TodoListFilterWidget> createState() => _TodoListFilterWidgetState();
}

enum Menu { all, byTime, deadline }

class _TodoListFilterWidgetState extends State<TodoListFilterWidget> {
  Menu _selectedMenu = Menu.all;
  late OverlayEntry floatingDropdown;

  bool isDropdownOpened = false;

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/images/svg/homescreenlist.svg",
                height: 25,
              ),
              SizedBox(
                width: 10,
              ),
              SvgPicture.asset(
                "assets/images/svg/List of todo.svg",
                height: 29,
              ),
            ],
          ),
          PopupMenuButton<Menu>(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                Radius.circular(12.0),
                ),
              ),
              child: Container(
                child: SvgPicture.asset(
                  "assets/images/svg/filter.svg",
                  width: 24,
                ),
              ),
              position: PopupMenuPosition.under,
              icon: null,
              constraints: BoxConstraints.expand(width: 126,height: 108),
              onSelected: (Menu item) {
                setState(() {
                  _selectedMenu = item;
                });
              },
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                PopupMenuItem<Menu>(
                  height: 26,
                  value: Menu.all,
                  child: Text('All',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: _selectedMenu == Menu.all ? Theme.of(context).primaryColor: Colors.black
                    ),
                  ),
                ),
                PopupMenuItem<Menu>(
                  height: 40,
                  value: Menu.byTime,
                  child: Text('By Time',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: _selectedMenu == Menu.byTime ? Theme.of(context).primaryColor: Colors.black
                      ),
                  ),
                ),
                PopupMenuItem<Menu>(
                  height: 26,
                  value: Menu.deadline,
                  child: Text('Deadline',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: _selectedMenu == Menu.deadline ? Theme.of(context).primaryColor: Colors.black
                    ),
                  ),
                ),

              ]),
        ],
      ),
    );
  }
}