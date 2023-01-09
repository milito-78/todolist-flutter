import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class EditWorkModalWidget extends StatefulWidget {
  const EditWorkModalWidget({Key? key}) : super(key: key);

  @override
  _EditWorkModalWidgetState createState() => _EditWorkModalWidgetState();
}

class _EditWorkModalWidgetState extends State<EditWorkModalWidget> {
  late DateTime? _selectedDate;
  late XFile? _file;

  _EditWorkModalWidgetState() : this._selectedDate = null,this._file = null;

  _getFromGallery() async {
    ImagePicker _picker = ImagePicker();
    _file = await _picker.pickImage(source: ImageSource.gallery);
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: Jiffy().add(years: 4).dateTime,
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  _resetTime(){
    setState(() {
      _selectedDate = null;
    });
  }

  _resetImage(){
    setState(() {
      _selectedDate = null;
    });
  }
  
  List<Widget> _handleDateFieldWidgets(){
    List<Widget> fields = [Icon(
      Icons.calendar_today_outlined,
      size: 24.0,
      color: _selectedDate == null
          ? Colors.white60
          : Colors.white,
    ),];

    if (_selectedDate != null)
    {
      fields.insert(0, IconButton(
          onPressed: () => _resetTime(),
          icon: Icon(
            Icons.clear,
            color: _selectedDate == null
                ? Colors.white60
                : Colors.white,
          )
      ),);
    }
    return fields;
  }


  List<Widget> _handleImageFieldWidgets(){
    List<Widget> fields = [Icon(
      Icons.image_outlined,
      size: 24.0,
      color: _selectedDate == null
          ? Colors.white60
          : Colors.white,
    ),];

    if (_file != null)
    {
      fields.insert(0, IconButton(
          onPressed: () => _resetImage(),
          icon: Icon(
            Icons.clear,
            color: _file == null
                ? Colors.white60
                : Colors.white,
          )
      ),);
    }
    return fields;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 8,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
            ),
            Container(
              width: 350,
              height: 50,
              child: TextField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
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
                  hintText: "Title",
                  hintStyle: TextStyle(color: Colors.white60, fontSize: 18),
                ),
              ),
            ),
            Container(
              width: 350,
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
              width: 350,
              height: 50,
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
                    Row(
                      children: _handleDateFieldWidgets()
                    ),
                  ],
                ),
                onPressed: () => _presentDatePicker(),
              ),
            ),
            Container(
              width: 350,
              height: 50,
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
                            ? "Add Image (Optional)"
                            : _file!.name,
                        style: TextStyle(
                            color: _selectedDate == null
                                ? Colors.white60
                                : Colors.white,
                            fontSize: 18)),
                    Row(
                        children: _handleImageFieldWidgets()
                    ),
                  ],
                ),
                onPressed: () => _getFromGallery(),
              ),
            ),
            Container(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  child: Text(
                    "EDIT TODO",
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).scaffoldBackgroundColor,
                    onPrimary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
