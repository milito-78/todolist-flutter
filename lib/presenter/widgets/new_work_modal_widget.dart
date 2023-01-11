import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:todolist/infrastructure/enums/sizes_enum.dart';
import 'package:todolist/presenter/widgets/buttons/create_button_widget.dart';
import 'package:todolist/presenter/widgets/inputs/create_input_widget.dart';
import 'package:todolist/presenter/widgets/line_widget.dart';

class NewWorkModalWidget extends StatefulWidget {
  const NewWorkModalWidget({Key? key}) : super(key: key);

  @override
  _NewWorkModalWidgetState createState() => _NewWorkModalWidgetState();
}

class _NewWorkModalWidgetState extends State<NewWorkModalWidget> {
  late DateTime? _selectedDate;
  late XFile? _file;

  _NewWorkModalWidgetState()
      : this._selectedDate = null,
        this._file = null;

  _getFromGallery() async {
    ImagePicker _picker = ImagePicker();

    var picked = await _picker.pickImage(source: ImageSource.gallery);
    if(picked == null)
      return;
    setState(() {
      _file = picked;
    });
  }

  void _presentDatePicker() {
    showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: Jiffy().add(years: 4).dateTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.white, // <-- SEE HERE
              onPrimary: Colors.black, // <-- SEE HERE
              onSurface: Colors.black, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.black, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  _resetTime() {
    setState(() {
      _selectedDate = null;
    });
  }

  _resetImage() {
    setState(() {
      _file = null;
    });
  }

  List<Widget> _handleDateFieldWidgets() {
    List<Widget> fields = [
      Icon(
        Icons.calendar_today_outlined,
        size: 24.0,
        color: _selectedDate == null ? Colors.white60 : Colors.white,
      ),
    ];

    if (_selectedDate != null) {
      fields.insert(
        0,
        IconButton(
            onPressed: () => _resetTime(),
            icon: Icon(
              Icons.clear,
              color: _selectedDate == null ? Colors.white60 : Colors.white,
            )),
      );
    }
    return fields;
  }

  List<Widget> _handleImageFieldWidgets() {
    List<Widget> fields = [
      Icon(
        Icons.image_outlined,
        size: 24.0,
        color: _selectedDate == null ? Colors.white60 : Colors.white,
      ),
    ];

    if (_file != null) {
      fields.insert(
        0,
        IconButton(
            onPressed: () => _resetImage(),
            icon: Icon(
              Icons.clear,
              color: _file == null ? Colors.white60 : Colors.white,
            )),
      );
    }
    return fields;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.fromLTRB(Paddings.left, 22.0, Paddings.right, 22.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            LineWidget(),
            CreateInputText("name", "Title"),
            Container(
              width: Input.width,
              height: 20 * 18,
              child: TextField(
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                maxLines: 18,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(width: 0.8),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(width: 2, color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(width: 2, color: Colors.white),
                  ),
                  hintText: "Description",
                  hintStyle: TextStyle(color: Colors.white60, fontSize: 18),
                ),
              ),
            ),
            Container(
              width: Input.width,
              height: Input.height,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 2, color: Colors.white),
                  shadowColor: Colors.white,
                  primary: const Color(0xFFF79E89),
                  onPrimary: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        _selectedDate == null
                            ? "Deadline (Optional)"
                            : '${DateFormat.yMd().format(_selectedDate!)}',
                        style: TextStyle(
                            color: _selectedDate == null
                                ? Colors.white60
                                : Colors.white,
                            fontSize: 18)),
                    Row(children: _handleDateFieldWidgets()),
                  ],
                ),
                onPressed: () => _presentDatePicker(),
              ),
            ),
            Container(
              width: Input.width,
              height: Input.height,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(width: 2, color: Colors.white),
                  shadowColor: Colors.white,
                  primary: const Color(0xFFF79E89),
                  onPrimary: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        _file == null ? "Add Image (Optional)" : _file!.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: _file == null ? Colors.white60 : Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Row(
                      children: _handleImageFieldWidgets(),
                    ),
                  ],
                ),
                onPressed: () => _getFromGallery(),
              ),
            ),
            CreateButton("ADD TODO", (context) {}),
          ],
        ),
      ),
    );
  }
}
