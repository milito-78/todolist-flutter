import 'package:get/get.dart';
import 'package:todolist/app/shared/token_manager.dart';
import 'package:todolist/app/users/register/data.dart';
import 'package:todolist/app/users/register/register_model.dart';
import 'package:todolist/app/users/register/request.dart';

class RegisterUserApp extends GetxController with TokenManager{
  final Request request;

  RegisterUserApp(this.request);

  Future<Data> execute(String fullName, String email, String password, String confirm) async {
    if(checkUserLoggedIn()) {

    }

    var data = await this.request.send(
          new RegisterModel(
            fullName,
            email,
            password,
            confirm,
          ),
        );

    await saveToken(data.token);

    return data;
  }

  bool checkUserLoggedIn(){

  }
}
