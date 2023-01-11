import 'package:flutter/material.dart';
import 'package:todolist/infrastructure/enums/sizes_enum.dart';
import 'package:todolist/presenter/widgets/edit_work_modal_widget.dart';
import 'package:todolist/presenter/widgets/todo_details_appbar_widget.dart';

class TodoDetailsScreen extends StatefulWidget {
  @override
  _TodoDetailsScreenState createState() => _TodoDetailsScreenState();
}

class _TodoDetailsScreenState extends State<TodoDetailsScreen> {
  Future<void> _askedToDelete() async {
    switch (await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return GestureDetector(
            onTap: () => Navigator.pop(context, false),
            child: Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom:  Paddings.bottom + 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: Input.width,
                        height: Input.height,
                        padding: EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white,
                        ),
                        child: SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          child: const Text(
                            'Delete TODO',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFF76C6A),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Container(
                        width: Input.width,
                        height: Input.height,
                        padding: EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            12.0,
                          ),
                          color: Colors.white,
                        ),
                        child: SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          child: const Text(
                            'Cancel',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF00FF19),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        })) {
      case true:
        print("yes");
        break;
      case false:
        print("no");
        break;
    }
  }

  void openEditModal(BuildContext context) {
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
          child: EditWorkModalWidget(), //TODO bind data
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              Paddings.left, Paddings.top, Paddings.right, 0
          ),
          child: Column(
            children: [
              TodoDetailsAppbarWidget(openEditModal, _askedToDelete),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  "Title",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum \n"
                      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\n"
                      'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              //TODO image input
              Container(
                margin: EdgeInsets.symmetric(vertical: Paddings.bottom + 10),
                child: Text(
                  'Created at 4 sept 2022',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
