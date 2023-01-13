import 'package:get/get.dart';
import 'package:todolist/app/shared/token_manager.dart';
import 'package:todolist/app/users/profile/data.dart';
import 'package:todolist/app/users/profile/request.dart';

class ProfileApp extends GetxController with TokenManager{
  final Request request;

  ProfileApp(this.request);

  Future<Data> execute() async {

    var data = await this.request.send(getToken());

    await saveToken(data.token);

    return data;
  }
}