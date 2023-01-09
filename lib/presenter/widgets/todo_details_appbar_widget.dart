import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_tooltip/super_tooltip.dart';

class TodoDetailsAppbarWidget extends StatefulWidget {
  final Function editFunc;
  final Function deleteFunc;

  TodoDetailsAppbarWidget(this.editFunc,this.deleteFunc);

  @override
  State<TodoDetailsAppbarWidget> createState() => _TodoDetailsAppbarWidgetState();
}

class _TodoDetailsAppbarWidgetState extends State<TodoDetailsAppbarWidget> {


  @override
  Widget build(BuildContext context) {
    SuperTooltip tooltip = SuperTooltip(
      containsBackgroundOverlay: true,
      arrowTipDistance: 18,
      arrowLength: 15,
      borderWidth: 0,
      borderColor: Theme.of(context).colorScheme.secondary,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      borderRadius: 12.0,
      popupDirection: TooltipDirection.down,
      showCloseButton: ShowCloseButton.none,
      hasShadow: false,
      content: new Material(
          color: Theme.of(context).colorScheme.secondary,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Text(
              "03 Sept 2021",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
              ),
              softWrap: true,
            ),
          )),
    );
    return Column(children: [
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios)
            ),
            Row(
              children: [
                Builder(
                  builder: (BuildContext child) =>  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    onPressed: () {
                      tooltip.show(child);
                      },
                    icon: SvgPicture.asset(
                      "assets/images/svg/clock2.svg",
                      color: Colors.black,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => widget.editFunc(context),
                  constraints: BoxConstraints(),
                  icon: SvgPicture.asset(
                    "assets/images/svg/edit.svg",
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: () {
                    widget.deleteFunc();
                  },
                  icon: SvgPicture.asset(
                    "assets/images/svg/trash.svg",
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ]);
  }
}
