import 'package:flutter/material.dart';
import 'package:todolist/my_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}
